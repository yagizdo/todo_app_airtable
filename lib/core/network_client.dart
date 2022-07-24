import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkClient {
  final baseUrl = dotenv.get('BASE_URL');
  final apiKey = dotenv.get('API_KEY');
  final appID = dotenv.get('APP_ID');

  // Dio
  Dio dio = Dio();
}
