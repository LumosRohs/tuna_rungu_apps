import 'package:flutter/material.dart';
import 'package:tuna_rungu_apps/pages/home.dart';
import 'package:tuna_rungu_apps/pages/register.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';

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
                              onTap: () async {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);

                                  if (credential.user != null) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return HomePage(
                                          email:
                                              credential.user?.email as String,
                                          displayName:
                                              credential.user?.displayName ==
                                                      null
                                                  ? "Guest"
                                                  : credential.user?.displayName
                                                      as String,
                                          photoURL:
                                              credential.user?.photoURL == null
                                                  ? ""
                                                  : credential.user?.photoURL
                                                      as String,
                                        );
                                      }),
                                    );
                                  }
                                } on FirebaseAuthException catch (e) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return LoginPopUp(msg: e.code);
                                    },
                                  );
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFFF5A21D),
                                  border: Border.all(
                                    color: const Color(0xFFF5A21D),
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

class LoginPopUp extends StatefulWidget {
  final String msg;
  const LoginPopUp({Key? key, required this.msg}) : super(key: key);

  @override
  State<LoginPopUp> createState() => _LoginPopUpState();
}

class _LoginPopUpState extends State<LoginPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(widget.msg),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Back'),
        )
      ],
    );
  }
}
