import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mustermv2/ForgotPassword.dart';
import 'package:mustermv2/Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool rememberMe = false;
  bool obscurePassword = true;
  
  // Controllers for the text fields
  final TextEditingController emailController = TextEditingController(text: "shivaaugusta@gmail.com");
  final TextEditingController nameController = TextEditingController(text: "Shiva Augusta");
  final TextEditingController passwordController = TextEditingController(text: "Shiva_1234");

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
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
                      const SizedBox(height: 80),
                      _buildHeader(),
                      const SizedBox(height: 30),
                      _buildForm(),
                      const SizedBox(height: 24),
                      _buildSignUpButton(),
                      const SizedBox(height: 16),
                      _buildSignInLink(),
                      const SizedBox(height: 16),
                      _buildSocialRegister(),
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
          'Selamat Datang',
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Please sign up to continue our app',
          style: GoogleFonts.nunito(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputLabel('Email atau No HP'),
        const SizedBox(height: 6),
        _buildTextField(
          controller: emailController,
          hintText: 'Email atau No HP',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 8),
        _buildInputLabel('Nama Lengkap'),
        const SizedBox(height: 6),
        _buildTextField(
          controller: nameController,
          hintText: 'Nama Lengkap',
        ),
        const SizedBox(height: 8),
        _buildInputLabel('Password'),
        const SizedBox(height: 6),
        _buildTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        _buildRememberMeAndForgotPassword(),
      ],
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF11668D),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF11668D),
          width: 1.5,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.nunito(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
              height: 15,
              child: Checkbox(
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? false;
                  });
                },
                activeColor: const Color(0xFF11668D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Pengingat',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPassword()),
            );
          },
          child: Text(
            'Lupa kata sandi?',
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: const Color(0xFFFF7029),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF11668D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Sign up',
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sudah punya akun? ',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to sign in page
          },
          child: Text(
            'Sign in',
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFF7029),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialRegister() {
    return Column(
      children: [
        Text(
          'Or connect',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(
              onPressed: () {
                // Handle Facebook register
              },
              iconPath: 'assets/img/facebook.png',
            ),
            const SizedBox(width: 24),
            _buildSocialButton(
              onPressed: () {
                // Handle Google register
              },
              iconPath: 'assets/img/google.png',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required String iconPath,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}