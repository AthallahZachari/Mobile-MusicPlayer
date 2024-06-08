import 'package:final_praktikum/pages/playsong_page.dart';
import 'package:flutter/material.dart';

class MySongCard extends StatelessWidget {
  final String songTitle;
  final String artist;
  final String albumName;
  final String? albumCoverurl;
  final String? albumID;
  final Function()? onTap;

  const MySongCard({
    super.key,
    required this.songTitle,
    required this.artist,
    required this.albumName,
    this.albumID,
    this.onTap,
    this.albumCoverurl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: .6, color: Color.fromARGB(255, 164, 164, 164))),
      ),
      child: Row(
        children: [
          Image.network(
            "$albumCoverurl",
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PlaySong(name: songTitle, imageUrl: "$albumCoverurl", albumName: albumName, artistName: artist);
                    }));
                  },
                  child: Text(
                    songTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      artist,
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        albumName,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 95, 95, 95),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
