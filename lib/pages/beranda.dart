import 'package:flutter/material.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool attended = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Selamat datang,',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          const Text(
            StudentData.name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'XI RPL 1 · SMK N 1 Bukateja',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Presensi Hari Ini',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '13/11',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                  children: [
                    _time(
                      attended ? '07:00' : '--:--',
                      'Masuk',
                    ),
                    _time('--:--', 'Pulang'),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        attended = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: Text(
                      attended
                          ? '✓ Presensi Berhasil'
                          : 'Presensi Masuk',
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),
          const Text(
            'Jadwal Hari Ini',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          if (!attended)
            _card(
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Presensi dulu untuk melihat jadwal hari ini',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            )
          else
            _card(
              Column(
                children: todaySchedule.map((item) {
                  return ListTile(
                    title: Text(
                      item['subject']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(item['teacher']!),
                    leading: Text(item['time']!),
                  );
                }).toList(),
              ),
            ),

          const SizedBox(height: 25),
          const Text(
            'Jurnal PKL',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          _card(
            const ListTile(
              leading: Icon(Icons.description_outlined),
              title: Text(
                'Periode PKL belum dimulai',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Aktif otomatis saat PKL dimulai',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _time(String time, String label) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _card(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: child,
    );
  }
}