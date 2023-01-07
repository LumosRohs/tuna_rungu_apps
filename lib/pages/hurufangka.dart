import 'package:flutter/material.dart';

class HurufAngkaPage extends StatelessWidget {
  const HurufAngkaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9E9D1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFFCA6027),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 27,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  const Expanded(
                    flex: 10,
                    child: Text(
                      "Huruf dan Angka",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Color(0xFFCA6027)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 56,
              ),
              const Text("test")
            ],
          ),
        ),
      ),
    );
  }
}
