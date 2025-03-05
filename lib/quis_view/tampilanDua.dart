// import 'dart:math';

import 'package:flutter/material.dart';

class Tampilandua extends StatefulWidget {
  @override
  _TampilanduaState createState() => _TampilanduaState();
}

class _TampilanduaState extends State<Tampilandua> {
  int? selectedYear;

  List<int> years = [2000, 2025, 2023, 2024]; // List tahun
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector (
                        onTap: () {
                            Navigator.pop(context);
                          },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text('Previous'),
                        ],
                      ),
                    ),
                  ),

                  Text(
                    '7/10',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 50),

              SizedBox(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none, // Agar elemen bisa keluar dari Stack
                  children: [
                    // Kotak Pertanyaan
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 229,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: -10,
                              blurRadius: 50,
                              offset: Offset(0, 20),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Tahun berapa saat ini?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Timer di atas kotak (setengahnya masuk ke dalam kotak)
                    Positioned(
                      top: -40, // Posisikan di atas kotak
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Progress Indicator
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              strokeCap: StrokeCap.round,
                              value: 0.5, // Ubah nilai ini sesuai timer
                              backgroundColor: Color(0xFFABD1C6),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF004643),
                              ),
                              strokeWidth: 8.0, // Ketebalan
                            ),
                          ),
                          // Angka timer di tengah
                          Text(
                            '30',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              SizedBox(
                child: Column(
                  children: [
                    for (int i = 0; i < years.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ), // Jarak antar pilihan
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // Border radius
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ), // Garis border
                          color:
                              selectedYear == years[i]
                                  ? Color(0xFFABD1C6)
                                  : Colors
                                      .white, // Warna latar belakang berubah jika dipilih
                        ),
                        child: ListTile(
                          title: Text('${years[i]}'),
                          trailing: Checkbox(
                            value: selectedYear == years[i],
                            onChanged: (bool? value) {
                              setState(() {
                                selectedYear = years[i];
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            activeColor: Color(
                              0xFF004643,
                            ), // Warna latar belakang checkbox saat dipilih
                            checkColor:
                                Colors.white, // Warna centang sesuai kode hex
                          ),
                          onTap: () {
                            setState(() {
                              selectedYear = years[i];
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004643),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tampilandua()),
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}