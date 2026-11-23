class StudentData {
  static const String name =
      'Muhammad Syah Fahril';

  static const String className = 'XI RPL 1';

  static const String school =
      'SMK Negeri 1 Bukateja';
      
  static const String nis = '9999';
  static const String nisn = '0000000000';
  static const String birthPlace = 'Purbalingga';
  static const String birthDate = '10 Maret 2010';
  static const String gender = 'Laki-laki';
  static const String religion = 'Islam';
  static const String address =
      'Kec. Bukateja, Kab. Purbalingga';
}

class Subject {
  final String name;
  final String teacher;

  const Subject(this.name, this.teacher);
}

const List<Subject> subjects = [
  Subject(
    'BAHASA INDONESIA',
    'NUR YULIANDRIANINGTYAS, S.Pd.',
  ),
  Subject(
    'BAHASA INGGRIS',
    'YUNITA KUSUMA WARDHANI, S.Pd',
  ),
  Subject(
    'BAHASA JAWA',
    'DYAN KARTIKAWATI, S.Pd',
  ),
  Subject(
    'BIMBINGAN KONSELING',
    'ABDI SHOLIH PRATAMA, S.Pd',
  ),
  Subject(
    'B. JEPANG',
    'IMAM MAULANA BURHANNUDIEN, S.Pd',
  ),
  Subject(
    'MATEMATIKA',
    'GURU MATEMATIKA, S.Pd',
  ),
  Subject(
    'PENDIDIKAN AGAMA ISLAM',
    'GURU PAI, S.Pd.I',
  ),
  Subject(
    'PENDIDIKAN PANCASILA',
    'GURU PPKN, S.Pd',
  ),
  Subject(
    'SEJARAH INDONESIA',
    'GURU SEJARAH, S.Pd',
  ),
  Subject(
    'PJOK',
    'GURU PJOK, S.Pd',
  ),
  Subject(
    'INFORMATIKA',
    'GURU INFORMATIKA, S.Kom',
  ),
  Subject(
    'KONSENTRASI KEAHLIAN RPL',
    'GURU KEAHLIAN RPL, S.Kom',
  ),
];

const List<Map<String, String>> todaySchedule = [
  {
    'time': '07:00 - 07:45',
    'subject': 'MATEMATIKA',
    'teacher': 'GURU MATEMATIKA, S.Pd',
  },
  {
    'time': '07:45 - 08:30',
    'subject': 'PENDIDIKAN AGAMA ISLAM',
    'teacher': 'GURU PAI, S.Pd.I',
  },
  {
    'time': '08:30 - 09:15',
    'subject': 'KONSENTRASI KEAHLIAN RPL',
    'teacher': 'GURU KEAHLIAN RPL, S.Kom',
  },
  {
    'time': '09:30 - 10:15',
    'subject': 'B. JEPANG',
    'teacher': 'IMAM MAULANA BURHANNUDIEN, S.Pd',
  },
  {
    'time': '10:15 - 11:00',
    'subject': 'PJOK',
    'teacher': 'GURU PJOK, S.Pd',
  },
];