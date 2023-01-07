import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HurufAngkaPage extends StatelessWidget {
  const HurufAngkaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5A21D),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 24,
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.centerLeft,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Iconsax.arrow_left,
                    ),
                    color: const Color(0xFF475467),
                  ),
                  const Text(
                    "Kembali",
                    style: TextStyle(
                      color: Color(0xFF475467),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Huruf dan Angka",
                style: TextStyle(
                  color: Color(0xFF1D2939),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Flexible(
                child: Text(
                  "Belajar bahasa isyarat huruf dan angka dengan gambar tutorial",
                  style: TextStyle(
                    color: Color(0xFF667085),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Flexible(
                flex: 20,
                child: HurufdanAngkaContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HurufdanAngkaContainer extends StatelessWidget {
  HurufdanAngkaContainer({Key? key}) : super(key: key);

  final List<Map> myList = [
    {"name": "Huruf Y"},
    {"name": "Huruf Z"},
    {"name": "Huruf A"},
    {"name": "Huruf B"},
    {"name": "Huruf C"},
    {"name": "Huruf D"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10),
        itemCount: myList.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/image-dummy.png'), // ganti disini myList[index]["url"]
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        myList[index]["name"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF1D2939),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                              color: const Color(0xFFD0D5DD),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(16, 24, 40, 0.05),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 14),
                          child: const Text(
                            "Keluar",
                            style: TextStyle(
                              color: Color(0xFF344054),
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
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(
                      color: const Color(0xFFEAECF0),
                    ),
                  ),
                  child: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        'assets/images/image-dummy.png'), // ganti disini myList[index]["url"]
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    border: Border.all(
                      color: const Color(0xFFEAECF0),
                    ),
                  ),
                  child: Text(
                    myList[index]["name"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1D2939),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        });
  }
}
