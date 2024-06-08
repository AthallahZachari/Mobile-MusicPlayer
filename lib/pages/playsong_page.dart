import 'package:final_praktikum/pages/widgets/playbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaySong extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String albumName;
  final String artistName;

  const PlaySong(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.albumName,
      required this.artistName});

  @override
  _playSongState createState() => _playSongState();
}

class _playSongState extends State<PlaySong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //appbar
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(CupertinoIcons.back)),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Playing from album",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                widget.albumName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.menu)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            
            //ALBUM COVER
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.5), 
                      spreadRadius: 5, 
                      blurRadius: 7, 
                      offset: Offset(3, 3), // Posisi bayangan dalam x dan y
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Image.network(
                  widget.imageUrl,
                  width: 300,
                  height: 300,
                ),
                ),
              ),
            ),

            const SizedBox(height: 50),
            //SONG TITLE
            PlayButtonGroup(
                songName: widget.name, artistName: widget.artistName),
          ],
        ),
      ),
    );
  }
}
