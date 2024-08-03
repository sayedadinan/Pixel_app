import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ValidationService {
  //validating the pancard numbers
  Future<bool> panValidation(String panNumber) async {
    log('worked');
    final url = Uri.parse('https://lab.pixel6.co/api/verify-pan.php');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'panNumber': panNumber});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        log(responseBody['status']);
        return responseBody['status'] == 'Success' &&
            responseBody['isValid'] == true;
      } else {
        // Handle non-200 status codes here if needed
        return false;
      }
    } catch (error) {
      // Handle errors (e.g., network issues) here
      log('Error: $error');
      return false;
    }
  }
}
