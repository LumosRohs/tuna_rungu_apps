import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

class HurufAngkaPage extends StatelessWidget {
  const HurufAngkaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // title: SafeArea(
          //   child: Row(
          //     children: [
          //       IconButton(
          //         iconSize: 24,
          //         padding: const EdgeInsets.all(0),
          //         alignment: Alignment.centerLeft,
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         icon: const Icon(
          //           Iconsax.arrow_left,
          //         ),
          //         color: const Color(0xFF475467),
          //       ),
          //       const Text(
          //         "Kembali",
          //         style: TextStyle(
          //           color: Color(0xFF475467),
          //           fontSize: 16,
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 32,
          //       ),
          //     ],
          //   ),
          // ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFF5A21D),
        body: TabBarView(
          children: [
            Container(
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
                  const Text(
                    "Angka",
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
                    child: AngkaContainer(),
                  ),
                ],
              ),
            ),
            Container(
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
                  const Text(
                    "Huruf",
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
                    child: HurufContainer(),
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

class HurufContainer extends StatelessWidget {
  HurufContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference huruf = db.collection('abjad');

    return FutureBuilder<QuerySnapshot>(
      future: huruf.get(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text('Loading events...'));
        }
        return GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10),
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
                          snapshot.data?.docs[index]['abjad'],
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
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: const Color(0xFFEAECF0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
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
                      snapshot.data?.docs[index]['abjad'],
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
  AngkaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference huruf = db.collection('angka');

    return FutureBuilder<QuerySnapshot>(
      future: huruf.get(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text('Loading events...'));
        }
        return GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10),
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
                  Video(linkVideo: snapshot.data?.docs[index]['link']),
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
                      snapshot.data?.docs[index]['angka'],
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

class Video extends StatefulWidget {
  final String linkVideo;

  const Video({Key? key, required this.linkVideo}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.linkVideo);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize();
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        border: Border.all(
          color: const Color(0xFFEAECF0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          VideoPlayer(_controller),
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
