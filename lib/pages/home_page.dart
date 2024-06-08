import 'package:final_praktikum/pages/widgets/homepage_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_praktikum/connection/base.dart';

class SearchPage extends StatefulWidget {
  final String username;

  const SearchPage({super.key, required this.username});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final ApiService apiService = ApiService();

  List<Map<String, dynamic>> _tracks = [];
  bool _loading = false;

  Future<void> searchTracks(String query) async {
    setState(() {
      _loading = true;
    });

    try {
      final tracks = await apiService.searchTracks(query);
      setState(() {
        _tracks = tracks;
      });
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String trackID = "";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(CupertinoIcons.person_2_fill),
                    const SizedBox(width: 10),
                    Text("Hi There, ${widget.username}!",
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(CupertinoIcons.camera_fill),
                ),
              ],
            ),

            const SizedBox(height: 10),

            //SearchBar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller, 
                      decoration: const InputDecoration(
                        hintText: "What do you want to listen to?",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (query) {
                        if (query.isNotEmpty) {
                          searchTracks(query);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        searchTracks(_controller.text);
                      }
                    },
                  ),
                ],
              ),
            ),


            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: _tracks.length,
                      itemBuilder: (context, index) {
                        final track = _tracks[index];
                        trackID = track['id'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          //Tampilan per card
                          child: MySongCard(
                            songTitle: track['name'],
                            artist: track['artist'],
                            albumName: track['namaAlbum'],
                            albumCoverurl: track['albumCoverUrl'],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
