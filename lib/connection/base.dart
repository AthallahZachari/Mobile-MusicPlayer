import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'd24cb90b35msh146b33081ee7150p1f1936jsnf2c1f8befb19';
  final String apiHost = 'spotify23.p.rapidapi.com';

  //[GET] Mengambil semua isi dari semua kategori  
  Future<List<Map<String, dynamic>>> searchTracks(String query) async {
    final response = await http.get(
      Uri.parse('https://spotify23.p.rapidapi.com/search/?q=${query}&type=&offset=0&limit=50&numberOfTopResults=5'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': apiHost,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['tracks'] != null && jsonResponse['tracks']['items'] != null) {
        return List<Map<String, dynamic>>.from(jsonResponse['tracks']['items'].map((item) {
           
          final data = item['data'];
          final artist = data['artists']['items'][0]['profile']['name'];
          final albumCoverURL = data['albumOfTrack']['coverArt']['sources'][0]['url'];
          final dataAlbum = data['albumOfTrack'];
          return {
            'uri': data['uri'],
            'id': data['id'],
            'name': data['name'],
            'artist': artist,
            'albumCoverUrl': albumCoverURL,
            'namaAlbum': dataAlbum['name'],
            'albumID': dataAlbum['id'],
          };
        }));
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load tracks');
    }
  }
}
