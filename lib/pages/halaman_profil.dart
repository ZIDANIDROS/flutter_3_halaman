import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({Key? key}) : super(key: key);

  // Fungsi widget profil reusable
  Widget buildProfile({
    required String nama,
    required String tglLahir,
    required String alamat,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  const TextSpan(text: "Nama:\n", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "$nama\n\n"),
                  const TextSpan(text: "Tempat, Tanggal Lahir:\n", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "$tglLahir\n\n"),
                  const TextSpan(text: "Alamat:\n", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: alamat),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          title: const Text(
            'Profile Page',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 4.0,
                  color: Colors.black26,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.blueGrey),
          ),

      body: Padding(
        padding: const EdgeInsets.only(bottom: 0), // Biar gak nabrak tombol bawah
        child: ListView(
          children: [
            buildProfile(
              nama: "Zahra Jane Arnecia",
              tglLahir: "Tangerang, 7 January 2005",
              alamat: "Tangerang Selatan, Bintaro Jaya",
              imageUrl: 'assets/images/anggota1.jpg', //
            ),
            buildProfile(
              nama: "Husein Zidan",
              tglLahir: "Malang, 9 November 1999",
              alamat: "Depok, Jawa Barat",
              imageUrl: 'assets/images/anggota2.jpg', //
            ),
            buildProfile(
              nama: "Muhammad Sulthan Zharfan",
              tglLahir: "Palembang, 9 Januari 2004",
              alamat: "Bogor, Jawa Barat",
              imageUrl: 'assets/images/anggota3.jpg', //
            ),
          ],
        ),
      ),
    );
  }
}
