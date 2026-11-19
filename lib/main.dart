import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff1769AA),
        ),
      ),
      home: JarakPage(),
    );
  }
}

class JarakPage extends StatefulWidget {
  @override
  State<JarakPage> createState() => _JarakPageState();
}

class _JarakPageState extends State<JarakPage> {
  final waktu = TextEditingController();
  final kecepatan = TextEditingController();

  String hasil = "";

  void hitungJarak() {
    double? t = double.tryParse(waktu.text);
    double? v = double.tryParse(kecepatan.text);

    if (t == null || v == null) {
      setState(() {
        hasil = "Masukkan angka yang valid!";
      });
      return;
    }

    double s = t * v;

    setState(() {
      hasil = "Jarak = $s";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F5FA),
      appBar: AppBar(
        title: Text(
          "Kalkulator Jarak",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1769AA),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff1769AA),
                    Color(0xff43A5D9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.route,
                    color: Colors.white,
                    size: 45,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Hitung Jarak Perjalanan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Masukkan waktu dan kecepatan untuk mengetahui jarak tempuh.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Text(
              "Input Perhitungan",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xff263746),
              ),
            ),

            SizedBox(height: 15),

            // INPUT CARD
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: waktu,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      labelText: "Waktu (t)",
                      hintText: "Contoh: 2",
                      prefixIcon: Icon(
                        Icons.access_time,
                        color: Color(0xff1769AA),
                      ),
                      suffixText: "Jam",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Color(0xff1769AA),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 18),

                  TextField(
                    controller: kecepatan,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      labelText: "Kecepatan (v)",
                      hintText: "Contoh: 60",
                      prefixIcon: Icon(
                        Icons.speed,
                        color: Color(0xff1769AA),
                      ),
                      suffixText: "Km/jam",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Color(0xff1769AA),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: hitungJarak,
                      icon: Icon(Icons.calculate),
                      label: Text(
                        "Hitung Jarak",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1769AA),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            // RESULT
            Text(
              "Hasil Perhitungan",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xff263746),
              ),
            ),

            SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xffD8E8F5),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xff1769AA),
                    size: 35,
                  ),
                  SizedBox(height: 10),
                  Text(
                    hasil.isEmpty ? "Hasil akan muncul di sini" : hasil,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1769AA),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rumus: Jarak = Waktu × Kecepatan",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
