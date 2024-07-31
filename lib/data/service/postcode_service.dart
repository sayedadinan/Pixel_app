import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class PostcodeService {
  getPostcodeDetails(int postcode) async {
    final url = Uri.parse('https://lab.pixel6.co/api/get-postcode-details.php');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'postcode': postcode});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 'Success') {
          // Extract city and state from the response
          final city = responseBody['city'][0]['name'];
          final state = responseBody['state'][0]['name'];
          return {
            'city': city,
            'state': state,
          };
        } else {
          throw Exception('Failed to fetch postcode details');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (error) {
      log('Error: $error');
      // return null;
    }
  }
}
