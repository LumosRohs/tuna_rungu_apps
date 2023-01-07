import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFFFFCF2),
                foregroundColor: Color(0xFFDB8818),
                child: Text(
                  'LR',
                  style: TextStyle(
                    color: Color(0xFFDB8818),
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Lingga Rohadyan",
                style: TextStyle(
                  color: Color(0xFF1D2939),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "linggarohadyan46@gmail.com",
                style: TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFEAECF0),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Iconsax.edit5,
                          color: Color.fromRGBO(219, 136, 24, 0.7),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Ubah profile",
                          style: TextStyle(
                            color: Color(0xFF344054),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFEAECF0),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Iconsax.lock5,
                          color: Color.fromRGBO(219, 44, 62, 0.7),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Ubah password",
                          style: TextStyle(
                            color: Color(0xFF344054),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFEAECF0),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Iconsax.sms5,
                          color: Color.fromRGBO(101, 203, 67, 0.7),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Ubah email",
                          style: TextStyle(
                            color: Color(0xFF344054),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFEAECF0),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Iconsax.camera5,
                          color: Color.fromRGBO(5, 137, 214, 0.7),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Ubah foto",
                          style: TextStyle(
                            color: Color(0xFF344054),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
