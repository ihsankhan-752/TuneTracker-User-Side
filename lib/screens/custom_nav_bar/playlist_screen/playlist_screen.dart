import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick_radio/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../services/spotify_services.dart';
import '../../../theme/colors.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  YoutubePlayerController? controller;

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int? currentIndex;

  void playPauseSong(int index) async {
    if (isPlaying && currentIndex == index) {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(trackUrls[index].url.toString()));
      setState(() {
        currentIndex = index;
        isPlaying = true;
      });
    }
  }

  String spotifyUrl = '';
  String videoUrl = "";

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  getSpotifyFromDatabase() async {
    QuerySnapshot data = await FirebaseFirestore.instance.collection("spotify").get();

    fetchPlaylistData(data.docs[0]['spotifyLink']);
  }

  getYoutubeUrl() async {
    QuerySnapshot data = await FirebaseFirestore.instance.collection("youtube").get();
    if (data.docs.isEmpty) {
      return;
    }
    setState(() {
      videoUrl = data.docs[0]['videoLink'];
    });
  }

  @override
  void initState() {
    getSpotifyFromDatabase();
    getYoutubeUrl();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryBlack,
          elevation: 0,
          title: SizedBox(
            height: 100,
            width: 90,
            child: Image.asset('images/logo.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Video of The Week",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 20),
              videoUrl.isEmpty
                  ? Center(
                      child: Text(
                      "No Video Found",
                      style: AppTextStyles.heading1,
                    ))
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              Divider(thickness: 1, color: AppColors.mainColor),
              Text(
                "Top 10 Weekly",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trackUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(color: AppColors.primaryWhite.withOpacity(0.09)),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: InkWell(
                        onTap: () async {
                          playPauseSong(index);
                        },
                        child: Container(
                          height: 50,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                trackUrls[index].image.toString(),
                              ),
                            ),
                          ),
                          child: Icon(
                            isPlaying && currentIndex == index ? Icons.pause : Icons.play_arrow,
                            size: 25,
                            color: AppColors.primaryWhite,
                          ),
                        ),
                      ),
                      title: Text(
                        trackUrls[index].name.toString(),
                        style: TextStyle(color: AppColors.primaryWhite),
                      ),
                      trailing: FittedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: AppColors.primaryWhite,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.more_vert,
                              color: AppColors.primaryWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
