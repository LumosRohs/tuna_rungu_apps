import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  final String displayName;
  final String email;
  final String photoURL;

  const ProfilePage(
      {Key? key,
      required this.email,
      required this.displayName,
      required this.photoURL})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final changeDisplayName = TextEditingController();
  final changeEmail = TextEditingController();
  final changePassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        print(user.displayName);
      }
    });
  }

  void changeDisplayNameFirebase(displayName) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await user.updateDisplayName(displayName);
      }
    });
  }

  void changePhotoUrlFirebase(url) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await user.updatePhotoURL(url);
      }
    });
  }

  void changeEmailFirebase(email) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await user.updateEmail(email);
      }
    });
  }

  void changePasswordFirebase(password) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await user.updatePassword(password);
      }
    });
  }

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
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.photoURL),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(200, 200)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.displayName,
                style: const TextStyle(
                  color: Color(0xFF1D2939),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.email,
                style: const TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Ubah Nama",
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
                              controller: changeDisplayName,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ubah Nama",
                                contentPadding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Align(
                              alignment: const Alignment(0, 1),
                              child: InkWell(
                                onTap: () {
                                  changeDisplayNameFirebase(
                                      changeDisplayName.text);
                                  Navigator.pop(context);
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
                                    "Ubah",
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
                ),
                child: Container(
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
                            "Ubah Nama",
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
              ),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Ubah Password",
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
                              controller: changePassword,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ubah Password",
                                contentPadding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Align(
                              alignment: const Alignment(0, 1),
                              child: InkWell(
                                onTap: () {
                                  changePasswordFirebase(changePassword.text);
                                  Navigator.pop(context);
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
                                    "Ubah",
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
                ),
                child: Container(
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
              ),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Ubah Email",
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
                              controller: changeEmail,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ubah Email",
                                contentPadding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Align(
                              alignment: const Alignment(0, 1),
                              child: InkWell(
                                onTap: () {
                                  changeEmailFirebase(changeEmail.text);
                                  Navigator.pop(context);
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
                                    "Ubah",
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
                ),
                child: Container(
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
              ),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "Ubah Foto",
                            style: TextStyle(
                              color: Color(0xFF344054),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          UploadImageChangeDisplay(),
                        ],
                      ),
                    ),
                  ),
                ),
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadImageChangeDisplay extends StatefulWidget {
  const UploadImageChangeDisplay({Key? key}) : super(key: key);

  @override
  State<UploadImageChangeDisplay> createState() =>
      UploadImageChangeDisplayState();
}

class UploadImageChangeDisplayState extends State<UploadImageChangeDisplay> {
  late File _imageFile;
  bool _load = false;

  final ImagePicker picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
      _load = true;
    });
  }

  Future uploadImage(BuildContext context) async {
    String fileName = basename(_imageFile.path);

    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child("profile/picture/${fileName}");

    try {
      await imagesRef.putFile(_imageFile);
      await imagesRef.getDownloadURL().then(
            (url) => FirebaseAuth.instance.authStateChanges().listen(
              (User? user) async {
                if (user != null) {
                  await user.updatePhotoURL(url);
                }
              },
            ),
          );
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: _load == true
              ? Image.file(_imageFile)
              : TextButton(
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 80,
                  ),
                  onPressed: pickImage,
                ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {
            print("haiii ubah foto ");
            uploadImage(context);
            Navigator.pop(context);
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              "Ubah",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
