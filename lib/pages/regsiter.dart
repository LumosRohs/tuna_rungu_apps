import 'package:flutter/material.dart';
import 'package:tuna_rungu_apps/pages/home.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xFFFFF4D2),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: SafeArea(
                    child: Row(
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
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 16, top: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daftar",
                          style: TextStyle(
                            color: Color(0xFF1D2939),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "Harap memasukkan email yang aktif",
                          style: TextStyle(
                            color: Color(0xFF667085),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          "Nama",
                          style: TextStyle(
                            color: Color(0xFF344054),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFD0D5DD),
                            ),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(16, 24, 40, 0.05),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16),
                            controller: namaController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nama",
                              contentPadding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                            color: Color(0xFF344054),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFD0D5DD),
                            ),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(16, 24, 40, 0.05),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16),
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              contentPadding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                            color: Color(0xFF344054),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFD0D5DD),
                            ),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(16, 24, 40, 0.05),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16),
                            obscureText: _isObscure,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              contentPadding: const EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_isObscure == true) {
                                      _isObscure = false;
                                    } else {
                                      _isObscure = true;
                                    }
                                  });
                                },
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Flexible(
                          child: Align(
                            alignment: const Alignment(0, 0.5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFFF5A21D),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(16, 24, 40, 0.05),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                child: const Text(
                                  "Daftar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
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
    );
  }
}
