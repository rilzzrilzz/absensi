import 'package:flutter/material.dart';
import 'data.dart';
import '/auth/login.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.black,
            child: Text(
              'MS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            StudentData.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'XI RPL 1 · SMK Negeri 1 Bukateja',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 28),

          _stats(),

          const SizedBox(height: 25),

          _menu(
            context,
            Icons.person_outline,
            'Data Diri',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DataDiriScreen(),
                ),
              );
            },
          ),

          _menu(
            context,
            Icons.face_retouching_natural,
            'Registrasi Wajah',
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Fitur registrasi wajah belum aktif.',
                  ),
                ),
              );
            },
          ),

          _menu(
            context,
            Icons.refresh,
            'Reset Wajah',
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Permintaan reset wajah belum tersedia.',
                  ),
                ),
              );
            },
          ),

          _menu(
            context,
            Icons.logout,
            'Logout',
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            bold: true,
          ),
        ],
      ),
    );
  }

  Widget _stats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Stat(number: '0', label: 'Hadir'),
          _Stat(number: '0', label: 'Sakit'),
          _Stat(number: '0', label: 'Izin'),
          _Stat(number: '0', label: 'Alpha'),
        ],
      ),
    );
  }

  Widget _menu(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool bold = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(
            fontWeight:
                bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: title == 'Logout'
            ? null
            : const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String number;
  final String label;

  const _Stat({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class DataDiriScreen extends StatelessWidget {
  const DataDiriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final details = {
      'Nama': StudentData.name,
      'Tempat Lahir': StudentData.birthPlace,
      'Tanggal Lahir': StudentData.birthDate,
      'Jenis Kelamin': StudentData.gender,
      'Telepon': '-',
      'NIS': StudentData.nis,
      'NISN': StudentData.nisn,
      'NIK': '-',
      'Agama': StudentData.religion,
      'Alamat': StudentData.address,
      'Anak Ke-': '-',
      'Asal Sekolah': '-',
    };

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text('Data Diri'),
        backgroundColor: const Color(0xFFF6F6F6),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Data Personal',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Column(
              children: details.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          entry.value,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}