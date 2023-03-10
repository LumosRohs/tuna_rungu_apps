import 'package:flutter/material.dart';
import 'package:tuna_rungu_apps/pages/hurufangka.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tuna_rungu_apps/pages/imbuhan.dart';
import 'package:tuna_rungu_apps/pages/kosakata.dart';
import 'package:tuna_rungu_apps/pages/profile.dart';
import 'package:tuna_rungu_apps/pages/tambahkata.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const HurufAngkaPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteProfile(String displayName, String email, String photoURL) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(
      displayName: displayName,
      email: email,
      photoURL: photoURL,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteKataIsyarat() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const KosakataPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteImbuhan() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ImbuhanPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteTambahKata() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TambahKataPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class HomePage extends StatelessWidget {
  final String displayName;
  final String email;
  final String photoURL;

  const HomePage(
      {Key? key,
      required this.displayName,
      required this.email,
      required this.photoURL})
      : super(key: key);

  String getInitials(String displayName) => displayName.isNotEmpty
      ? displayName.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                  ),
                  color: Color(0xFFF5A21D)),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Halo, ${displayName.toString()}",
                                style: const TextStyle(
                                  color: Color(0xFFF2F4F7),
                                  fontSize: 16,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(_createRouteProfile(
                                    displayName,
                                    email,
                                    photoURL,
                                  ));
                                },
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xFFFFFCF2),
                                  foregroundColor: const Color(0xFFDB8818),
                                  child: photoURL == ""
                                      ? Text(
                                          getInitials(displayName),
                                        )
                                      : Image.network(
                                          photoURL,
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 200,
                            child: Text(
                              "Ayo belajar bahasa isyarat",
                              style: TextStyle(
                                color: Color(0xFFFCFCFD),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/images/reading-book.png'),
                    height: 106,
                    width: 185,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: const Color(0xFFF1FEFE),
                  border: Border.all(
                    color: const Color(0xFFEAECF0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, bottom: 16, right: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(7, 177, 249, 0.4),
                        ),
                        child: const Center(
                          child: Image(
                            image: AssetImage('assets/images/info.png'),
                            height: 9.75,
                            width: 2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Kenapa belajar bahasa isyarat?",
                              style: TextStyle(
                                color: Color(0xFF1D2939),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Karena dapat membantu seseorang terhubung dengan orang-orang yang tuli, meningkatkan empati dan keterbukaan",
                              style: TextStyle(
                                color: Color(0xFF475467),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.02),
                              blurRadius: 16,
                              offset: Offset(0, 8),
                            ),
                          ]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFFFF4D2),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Iconsax.text_block5,
                                          color:
                                              Color.fromRGBO(219, 136, 24, 0.4),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      "Huruf dan Angka",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1D2939),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(_createRoute());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFFF5A21D),
                                        border: Border.all(
                                          color: const Color(0xFFF5A21D),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                16, 24, 40, 0.05),
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 14),
                                      child: const Text(
                                        "Belajar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.5, 0.5),
                                colors: [
                                  Color.fromRGBO(255, 244, 210, 1),
                                  Color.fromRGBO(255, 244, 210, 0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.02),
                              blurRadius: 16,
                              offset: Offset(0, 8),
                            ),
                          ]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFFFF4D2),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Iconsax.note5,
                                          color:
                                              Color.fromRGBO(219, 136, 24, 0.4),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      "Kata Isyarat",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1D2939),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(_createRouteKataIsyarat());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFFF5A21D),
                                        border: Border.all(
                                          color: const Color(0xFFF5A21D),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                16, 24, 40, 0.05),
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 14),
                                      child: const Text(
                                        "Belajar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.5, 0.5),
                                colors: [
                                  Color.fromRGBO(255, 244, 210, 1),
                                  Color.fromRGBO(255, 244, 210, 0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.02),
                              blurRadius: 16,
                              offset: Offset(0, 8),
                            ),
                          ]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFFFF4D2),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Iconsax.element_plus5,
                                          color:
                                              Color.fromRGBO(219, 136, 24, 0.4),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      "Kata Imbuhan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1D2939),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(_createRouteImbuhan());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFFF5A21D),
                                        border: Border.all(
                                          color: const Color(0xFFF5A21D),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                16, 24, 40, 0.05),
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 14),
                                      child: const Text(
                                        "Belajar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.5, 0.5),
                                colors: [
                                  Color.fromRGBO(255, 244, 210, 1),
                                  Color.fromRGBO(255, 244, 210, 0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.02),
                              blurRadius: 16,
                              offset: Offset(0, 8),
                            ),
                          ]),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFFFF4D2),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Iconsax.add_circle5,
                                          color:
                                              Color.fromRGBO(219, 136, 24, 0.4),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      "Tambah Kata",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1D2939),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(_createRouteTambahKata());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFFF5A21D),
                                        border: Border.all(
                                          color: const Color(0xFFF5A21D),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                16, 24, 40, 0.05),
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 14),
                                      child: const Text(
                                        "Belajar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.5, 0.5),
                                colors: [
                                  Color.fromRGBO(255, 244, 210, 1),
                                  Color.fromRGBO(255, 244, 210, 0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
