import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mustermv2/main.dart';
import 'dart:async';


class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  // Controllers for the OTP input fields
  final TextEditingController _firstController = TextEditingController(text: "1");
  final TextEditingController _secondController = TextEditingController(text: "2");
  final TextEditingController _thirdController = TextEditingController(text: "3");
  final TextEditingController _fourthController = TextEditingController(text: "0");
  
  // Focus nodes for the OTP input fields
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();
  
  // Timer for resend countdown
  Timer? _timer;
  int _countdownTime = 4;
  
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownTime > 0) {
          _countdownTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }
  
  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      _buildHeader(),
                      const SizedBox(height: 40),
                      _buildOtpInputs(),
                      const SizedBox(height: 24),
                      _buildNextButton(),
                      const SizedBox(height: 40),
                      _buildResendSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'OTP Verification',
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Periksa email Anda untuk mendapatkan kode OTP',
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildOtpInputs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kode OTP',
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOtpTextField(_firstController, _firstFocusNode, _secondFocusNode),
            _buildOtpTextField(_secondController, _secondFocusNode, _thirdFocusNode),
            _buildOtpTextField(_thirdController, _thirdFocusNode, _fourthFocusNode),
            _buildOtpTextField(_fourthController, _fourthFocusNode, null),
          ],
        ),
      ],
    );
  }

  Widget _buildOtpTextField(
    TextEditingController controller,
    FocusNode focusNode,
    FocusNode? nextFocusNode,
  ) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: GoogleFonts.nunito(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            nextFocusNode.requestFocus();
          }
        },
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(
                userName: '',
                userEmail: '',
              ),
            )
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF11668D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Selanjutnya',
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget _buildResendSection() {
    return Column(
      children: [
        Text(
          'Belum menerima email?',
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: Colors.grey,
            ),
            children: [
              const TextSpan(
                text: 'Kamu bisa mengirim ulang kode dalam ',
              ),
              TextSpan(
                text: '$_countdownTime',
                style: GoogleFonts.nunito(
                  color: const Color(0xFF11668D),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' dtk',
              ),
            ],
          ),
        ),
      ],
    );
  }
}