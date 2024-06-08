import 'package:flutter/material.dart';

class PlayButtonGroup extends StatelessWidget {
  final String songName;
  final String artistName;

  const PlayButtonGroup({
    super.key,
    required this.songName,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //JUDUL LAGU & ARTIST & FAVORITE
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(songName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16, overflow: TextOverflow.ellipsis)),
                    Text(artistName, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              FavoriteButton(),
            ],
          ),
          const SizedBox(height: 10),

          //PREV || PLAY || NEXT
          const Row(
            children: [
              PlayButtonOption(),
            ],
          ),
        ],
      ),
    );
  }
}

class PlayButtonOption extends StatefulWidget {
  const PlayButtonOption({super.key});

  @override
  _playButtonOptionState createState() => _playButtonOptionState();
}

class _playButtonOptionState extends State<PlayButtonOption> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous, size: 30.0)),
            IconButton(
                onPressed: () {
                  setState((){
                    isPressed = !isPressed;
                  });
                },
                icon: Icon(isPressed ? Icons.pause_circle : Icons.play_arrow, size: 50.0)),
            IconButton(onPressed: () {}, icon: Icon(Icons.skip_next, size: 35.0)),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _favoriteButtonState createState() => _favoriteButtonState();
}

class _favoriteButtonState extends State<FavoriteButton>{
  bool isLiked = false;

  @override
  Widget build(BuildContext context){
    return Container(
      child: IconButton(
        onPressed: (){
          setState((){
            isLiked = !isLiked;
          });
        }, icon: Icon(Icons.favorite, color: isLiked? Colors.red : Colors.grey )),
    );
  }
}
