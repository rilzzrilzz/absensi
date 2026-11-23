import 'package:flutter/material.dart';
import 'data.dart';

class LmsScreen extends StatefulWidget {
  const LmsScreen({super.key});

  @override
  State<LmsScreen> createState() => _LmsScreenState();
}

class _LmsScreenState extends State<LmsScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = subjects.where((s) {
      return s.name.toLowerCase().contains(
        search.toLowerCase(),
      );
    }).toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Mata Pelajaran',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '12 mata pelajaran · Gasal 2026/2027',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 18),

          TextField(
            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Cari mata pelajaran...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Column(
              children: filtered.map((s) {
                return ListTile(
                  title: Text(
                    s.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    s.teacher,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
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