import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mustermv2/main.dart';
import 'package:mustermv2/screens/Home.dart';

class ArScreen extends StatefulWidget {
  const ArScreen({super.key});

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  CameraController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _hideSystemUI();
    _initializeCamera();
  }

  void _hideSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  void _showSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.first;

    _controller = CameraController(backCamera, ResolutionPreset.max);
    await _controller!.initialize();
    if (!mounted) return;

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    _showSystemUI(); // restore saat keluar
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;

    final image = await _controller!.takePicture();
    if (!mounted) return;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isInitialized
          ? Stack(
              children: [
                SizedBox.expand(child: CameraPreview(_controller!)),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}


