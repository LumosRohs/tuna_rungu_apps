import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

class KosakataPage extends StatelessWidget {
  const KosakataPage({Key? key}) : super(key: key);

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
                "Kata Isyarat",
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
                  "Belajar kata isyarat dengan video tutorial",
                  style: TextStyle(
                    color: Color(0xFF667085),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.685,
                child: const KosakataContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KosakataContainer extends StatelessWidget {
  const KosakataContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference kosakata = db.collection('kosakata');

    return FutureBuilder<QuerySnapshot>(
      future: kosakata.get(),
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
                  content: VideoPop(
                    linkVideo: snapshot.data?.docs[index]['link'],
                    namaVideo: snapshot.data?.docs[index]['kata'],
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
                            'https://firebasestorage.googleapis.com/v0/b/imk-kel-1.appspot.com/o/kosakata%2Fthumbnail.png?alt=media&token=0583ece8-b9d3-4e23-8067-514eb8a5daeb'),
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
                      snapshot.data?.docs[index]['kata'],
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
