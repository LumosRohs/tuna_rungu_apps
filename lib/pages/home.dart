import 'package:flutter/material.dart';
import 'package:tuna_rungu_apps/pages/hurufangka.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9E9D1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 42, bottom: 42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Halo, Lingga",
                  style: TextStyle(
                    color: Color(0xFFCA6027),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    "Ayo belajar bahasa isyarat",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        height: 1.3,
                        color: Color(0xFFCA6027)),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                KelasBox(
                  title: "Huruf dan Angka",
                  subtitle:
                      "Belajar bahasa isyarat huruf dan angka dengan gambar tutorial",
                ),
                SizedBox(
                  height: 20,
                ),
                KelasBox(
                  title: "Huruf dan Angka",
                  subtitle:
                      "Belajar bahasa isyarat huruf dan angka dengan gambar tutorial",
                ),
                SizedBox(
                  height: 20,
                ),
                KelasBox(
                  title: "Huruf dan Angka",
                  subtitle:
                      "Belajar bahasa isyarat huruf dan angka dengan gambar tutorial",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KelasBox extends StatelessWidget {
  final String title, subtitle;
  const KelasBox({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HurufAngkaPage();
        }));
      },
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFFCA6027),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      height: 1.3,
                      color: Color(0xFFF9E9D1)),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              SizedBox(
                width: 140,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFFFFFF),
                    height: 1.3,
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
