import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  try {
    final response = await http.get(
        Uri.parse('https://random-data-api.com/api/users/random_user?size=11'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = jsonDecode(response.body);

      for (var user in decodedData) {
        if (user is Map<String, dynamic>) {
          final uid = user['uid'];
          final firstName = user['first_name'];
          final lastName = user['last_name'];

          print('ID: $uid, Full NAME: $firstName $lastName\n---');
        } else {
          print('Error: User data is not a map.');
        }
      }
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (err) {
    print('An error occurred: $err');
  }
}
