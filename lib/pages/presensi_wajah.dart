import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PresensiWajahScreen extends StatefulWidget {
  const PresensiWajahScreen({super.key});

  @override
  State<PresensiWajahScreen> createState() =>
      _PresensiWajahScreenState();
}

class _PresensiWajahScreenState
    extends State<PresensiWajahScreen> {

  CameraController? controller;
  XFile? foto;
  String? error;

  @override
  void initState() {
    super.initState();
    bukaKamera();
  }

  Future<void> bukaKamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        throw Exception('Kamera tidak ditemukan');
      }

      final depan = cameras.firstWhere(
        (camera) =>
            camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      controller = CameraController(
        depan,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await controller!.initialize();

      if (mounted) setState(() {});
    } catch (e) {
      if (mounted) {
        setState(() {
          error = e.toString();
        });
      }
    }
  }

  Future<void> ambilFoto() async {
    if (controller == null ||
        !controller!.value.isInitialized) return;

    try {
      final hasil = await controller!.takePicture();

      if (!mounted) return;

      setState(() {
        foto = hasil;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengambil foto: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Presensi Wajah'),
      ),
      body: error != null
          ? Center(
              child: Text(
                error!,
                style: const TextStyle(color: Colors.white),
              ),
            )
          : controller == null ||
                  !controller!.value.isInitialized
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: foto == null
                            ? CameraPreview(controller!)
                            : Image.file(
                                File(foto!.path),
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Pastikan wajah terlihat jelas '
                        'dan tidak menggunakan masker/topeng',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: IconButton(
                        onPressed: foto == null
                            ? ambilFoto
                            : () {
                                setState(() {
                                  foto = null;
                                });
                              },
                        icon: Icon(
                          foto == null
                              ? Icons.camera_alt
                              : Icons.refresh,
                          size: 45,
                          color: Colors.black,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}