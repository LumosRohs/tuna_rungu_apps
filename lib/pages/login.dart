import 'package:flutter/material.dart';
import 'package:tuna_rungu_apps/pages/home.dart';
import 'package:tuna_rungu_apps/pages/regsiter.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const RegisterPage(),
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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: SafeArea(
                      child: Center(
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                              height: 120,
                              width: 120,
                            ),
                            Text(
                              "Selamat datang",
                              style: TextStyle(
                                color: Color(0xFF1D2939),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Mulai belajar bahasa isyarat",
                              style: TextStyle(
                                color: Color(0xFF667085),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            alignment: const Alignment(0, 1),
                            child: InkWell(
                              onTap: () {
                                if (emailController.text == 'lingga' &&
                                    passwordController.text == 'lingga') {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const HomePage();
                                  }));
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: const Text(
                                            'Username atau password salah'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Back'),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
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
                                  "Masuk",
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Belum punya akun?"),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(_createRoute());
                              },
                              child: const Text(
                                "Daftar",
                                style: TextStyle(
                                  color: Color(0xFF0589D6),
                                ),
                              ),
                            ),
                          ],
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
