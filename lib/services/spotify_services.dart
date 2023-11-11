import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/spotify_model.dart';



List<SpotifyModel> trackUrls = [];


fetchPlaylistData(String playlistUrl) async {
  try {

    Uri uri = Uri.parse(playlistUrl);
    String playlistId = uri.pathSegments.last;

    final accessToken = await _getAccessToken();
    final apiUrl = 'https://api.spotify.com/v1/playlists/$playlistId/tracks';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final items = jsonResponse['items'];

      for (var item in items) {
        final track = item['track'];
        final previewUrl = track['preview_url'];
        final trackName = track['name'];
        final trackImage = track['album']['images'];
        trackUrls.add(SpotifyModel(
          url: previewUrl,
          name: trackName,
          image: trackImage[0]['url'],
        ));

      }
    }
  } catch(e){
  }
}

Future _getAccessToken() async {
  const clientId = 'bc1946092547444b81b85fac2faf76ff';
  const clientSecret = '9ae7a29389924813bffb9f2ba327f4ff';

  final credentials = '$clientId:$clientSecret';
  final encodedCredentials = base64.encode(utf8.encode(credentials));

  const authUrl = 'https://accounts.spotify.com/api/token';
  final response = await http.post(
    Uri.parse(authUrl),
    headers: {
      'Authorization': 'Basic $encodedCredentials',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {'grant_type': 'client_credentials'},
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse['access_token'];
  }

  return null;
}