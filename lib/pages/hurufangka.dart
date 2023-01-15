import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

class HurufAngkaPage extends StatefulWidget {
  const HurufAngkaPage({Key? key}) : super(key: key);

  @override
  State<HurufAngkaPage> createState() => _HurufAngkaPageState();
}

class _HurufAngkaPageState extends State<HurufAngkaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
                height: 16,
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
                height: 16,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(4),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(16, 24, 40, 0.1),
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(16, 24, 40, 0.06),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  labelColor: const Color(0xFF344054),
                  unselectedLabelColor: const Color(0xFF667085),
                  tabs: const [
                    Tab(
                      text: 'Huruf',
                    ),
                    Tab(
                      text: 'Angka',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.58,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HurufContainer(),
                    AngkaContainer(),
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

class HurufContainer extends StatelessWidget {
  const HurufContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference abjad = db.collection('abjad');

    return FutureBuilder<QuerySnapshot>(
      future: abjad.get(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return AlignedGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          itemCount: snapshot.data!.docs.length,
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
                        Image(
                          fit: BoxFit.fill,
                          image: snapshot.data?.docs[index]['link'] == ""
                              ? const AssetImage(
                                      'assets/images/image-dummy.png')
                                  as ImageProvider
                              : NetworkImage(
                                  snapshot.data?.docs[index]['link']),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Huruf ' + snapshot.data?.docs[index]['abjad'],
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
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: const Color(0xFFEAECF0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: snapshot.data?.docs[index]['link'] == ""
                            ? const AssetImage('assets/images/image-dummy.png')
                                as ImageProvider
                            : NetworkImage(snapshot.data?.docs[index]['link']),
                      ),
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
                      'Huruf ' + snapshot.data?.docs[index]['abjad'],
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
          },
        );
      },
    );
  }
}

class AngkaContainer extends StatelessWidget {
  const AngkaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference angka = db.collection('angka');

    return FutureBuilder<QuerySnapshot>(
      future: angka.get(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text('Loading events...'));
        }
        return AlignedGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: VideoPop(
                    linkVideo: snapshot.data?.docs[index]['link'],
                    namaVideo: snapshot.data?.docs[index]['angka'],
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: const Color(0xFFEAECF0),
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/imk-kel-1.appspot.com/o/angka%2Fthumbnail.png?alt=media&token=ecd82839-359b-47a0-ab28-8839c755812f'),
                      ),
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
                      'Angka ' + snapshot.data?.docs[index]['angka'],
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
          },
        );
      },
    );
  }
}

class VideoPop extends StatefulWidget {
  final String linkVideo;
  final String namaVideo;

  const VideoPop({Key? key, required this.linkVideo, required this.namaVideo})
      : super(key: key);

  @override
  State<VideoPop> createState() => _VideoPopState();
}

class _VideoPopState extends State<VideoPop> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.linkVideo);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: <Widget>[
                VideoPlayer(_controller),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            widget.namaVideo,
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
