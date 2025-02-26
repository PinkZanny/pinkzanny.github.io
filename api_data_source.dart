import 'dart:convert';

import 'package:cheap_fit/data/data_sources/shared_prefs.dart';
import 'package:cheap_fit/utils/constants.dart';
import 'package:cheap_fit/utils/datetime_now_utc.dart';
import 'package:http/http.dart' as http;

import '../../utils/ultra_logger.dart';

class ApiDataSource {
  static const apiEndPoint = Constants.apiEndpoint;
  static const publicApiHeaders = {'Content-Type': 'application/json', 'Authorization': Constants.apiKey};
  static final apiHeaders = {'Content-Type': 'application/json', 'Authorization': sharedPrefs.get(Constants.accessToken)};

  static const signUpEndPoint = '$apiEndPoint/auth-api/signup';
  static const loginEndPoint = '$apiEndPoint/auth-api/login';
  static const recoverEndPoint = '$apiEndPoint/auth-api/recover';
  static const userEndPoint = '$apiEndPoint/api/users';
  static const userPictureEndPoint = '$apiEndPoint/api/users/upload';
  static const tournamentsEndPoint = '$apiEndPoint/api/tournaments';
  static const balanceEndPoint = '$apiEndPoint/api/balance';
  static const tournamentsParticipantsEndPoint = '$apiEndPoint/api/participants';
  static const notificationsEndPoint = '$apiEndPoint/api/notifications';
  static const refreshTokenEndPoint = '$apiEndPoint/auth-api/refresh';
  static const questionnaireEndPoint = '$apiEndPoint/api/quiz';
  static const questionsEndPoint = '$apiEndPoint/api/quiz-questions';
  static const answersEndPoint = '$apiEndPoint/api/quiz-answers';
  static const userAnswersEndPoint = '$apiEndPoint/api/quiz-user-answers';
  static const historicMovementsEndPoint = '$apiEndPoint/api/historicCheapMovements';
  static const cheapMovementEndPoint = '$apiEndPoint/api/cheapMovements';
  static const cheapConversionEndPoint = '$apiEndPoint/api/cheapConversions';
  static const healthRecordEndPoint = '$apiEndPoint/api/health';
  static const bonusEndPoint = '$apiEndPoint/api/bonus';
  static const leaderboardEndPoint = '$apiEndPoint/api/leagues/realtime';
  static const versionControlEndPoint = '$apiEndPoint/api/versionControl';

  static Future<Map<String, dynamic>> getRequest(final String endpoint, {final Map<String, String>? headers, final Map<String, String>? body, final bool? hidden}) async {
    final response = await http.get(Uri.parse(endpoint), headers: headers);
    final ({Map<String, dynamic> body, bool success}) parsed = stockParser(response);
    return logRequest(parsed.success, endpoint, parsed.body, hidden);
  }

  static Future<Map<String, dynamic>> postRequest(final String endpoint, {final Map<String, String>? headers, final body, final bool? hidden}) async {
    final response = await http.post(Uri.parse(endpoint), headers: headers, body: json.encode(body));
    final ({Map<String, dynamic> body, bool success}) parsed = stockParser(response);
    return logRequest(parsed.success, endpoint, parsed.body, hidden);
  }

  static Future<Map<String, dynamic>> putRequest(final String endpoint, {final Map<String, String>? headers, final Map<String, dynamic>? body, final bool? hidden}) async {
    final response = await http.put(Uri.parse(endpoint), headers: headers, body: json.encode(body));
    final ({Map<String, dynamic> body, bool success}) parsed = stockParser(response);
    return logRequest(parsed.success, endpoint, parsed.body, hidden);
  }

  static ({Map<String, dynamic> body, bool success}) stockParser(final response) {
    final Map<String, dynamic> body = json.decode(response.body);
    final bool success = body['success'] ?? false;
    return (success: success, body: body);
  }

  static Map<String, dynamic> logRequest(final bool success, final String endpoint, final Map<String, dynamic> body, final bool? hidden) {
    if (success) {
      hidden != null ? null : UltraLogger.logSuccessApi(endpoint: endpoint, body: body);
      return body;
    } else {
      UltraLogger.logErrorApi(endpoint: endpoint, body: body);
      return body;
    }
  }

  static Future<Map<String, dynamic>?> signUp({required final String email, required final String username, required final String password, required final String? height, required final String? weight, required final String? sex}) async {
    final Map<String, dynamic> processedResponse = await postRequest(signUpEndPoint,
        body: {
          'firstName': '',
          'lastName': '',
          'email': email,
          'username': username,
          'phone': '',
          'password': password,
          'acceptPrivacy': DateTimeUtc.getDatetime(),
          'height': height,
          'weight': weight,
          'sex': sex == 'Male'
              ? 'M'
              : sex == 'Female'
                  ? 'F'
                  : 'Other'
        },
        headers: publicApiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> login({required final String email, required final String password}) async {
    final Map<String, dynamic> processedResponse = await postRequest(loginEndPoint, body: {'email': email, 'password': password}, headers: publicApiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> recover({required final String email}) async {
    final Map<String, dynamic> processedResponse = await postRequest(recoverEndPoint, body: {'email': email}, headers: publicApiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final Map<String, dynamic> processedResponse = await getRequest('$userEndPoint/${sharedPrefs.get(Constants.userId)}', headers: apiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>> getTournaments() async {
    final Map<String, dynamic> processedResponse = await getRequest(tournamentsEndPoint, headers: apiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>> getBalance() async {
    final Map<String, dynamic> processedResponse = await getRequest(balanceEndPoint, headers: apiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>> getParticipants({required final String tournamentId}) async {
    final Map<String, dynamic> processedResponse = await getRequest('$tournamentsParticipantsEndPoint/$tournamentId', headers: apiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>> getNotifications() async {
    final Map<String, dynamic> processedResponse = await getRequest('$notificationsEndPoint/${sharedPrefs.get(Constants.userId)}', headers: apiHeaders);
    return processedResponse;
  }

  static Future<bool> updateUser(final Map<String, dynamic> callBodyRaw) async {
    final Map<String, dynamic> processedResponse = await putRequest('$userEndPoint/${sharedPrefs.get(Constants.userId)}', headers: apiHeaders, body: callBodyRaw);
    if (processedResponse['success'] == true) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Map<String, dynamic>> getQuestionnaires() async {
    final Map<String, dynamic> processedResponse = await getRequest(questionnaireEndPoint, headers: apiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>> getRealtimeLeaderboard() async {
    final Map<String, dynamic> processedResponse = await getRequest(leaderboardEndPoint, headers: apiHeaders);
    return processedResponse;
  }

  static Future<List<Map<String, dynamic>>> getQuestionnaireById(final List<String> questionnaireIds) async {
    List<Map<String, dynamic>> questionnaires = [];
    for (String id in questionnaireIds) {
      final Map<String, dynamic> processedResponse = await getRequest('$questionnaireEndPoint/$id', headers: apiHeaders);
      questionnaires.add(processedResponse);
    }
    return questionnaires;
  }

  static Future<Map<String, dynamic>> getQuestions(final String questionnaireId) async {
    final Map<String, dynamic> processedResponse = await getRequest(questionsEndPoint, headers: apiHeaders, body: {'quizId': questionnaireId});
    return processedResponse;
  }

  static Future<Map<String, dynamic>> getAnswers(final String questionId) async {
    final Map<String, dynamic> processedResponse = await getRequest(answersEndPoint, headers: apiHeaders, body: {'questionId': questionId});
    return processedResponse;
  }

  static Future<Map<String, dynamic>> getHistoricMovements() async {
    final Map<String, dynamic> processedResponse = await getRequest(historicMovementsEndPoint, headers: apiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> updateProfilePicture(final http.MultipartFile image) async {
    final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(userPictureEndPoint));
    request.headers.addAll({'Content-Type': 'multipart/form-data', 'Authorization': sharedPrefs.get(Constants.accessToken)});
    request.files.add(image);
    UltraLogger.logInfo('content type: ${image.contentType}\n[INFO] filename: ${image.filename}\n[INFO] image field: ${image.field}\n[INFO] image.length: ${image.length}');
    final http.StreamedResponse response = await request.send();
    UltraLogger.logWarn('sent request');
    final Map<String, dynamic> processedResponse = json.decode(await response.stream.bytesToString());
    UltraLogger.logWarn('processed response: $processedResponse');
    if (processedResponse['success'] == true) {
      UltraLogger.logSuccessApi(endpoint: userPictureEndPoint, body: processedResponse);
      return processedResponse;
    } else {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> changePassword({required final String newPassword, required final String recoveryNumber}) async {
    final Map<String, dynamic> processedResponse = await postRequest('$apiEndPoint/auth-api/reset', headers: publicApiHeaders, body: {'password': newPassword, 'recoveryNumber': recoveryNumber});
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> addCheapMovement(final int amount, final String type) async {
    final processedResponse = await postRequest(cheapMovementEndPoint, headers: apiHeaders, body: {'amount': amount, 'type': type, 'userId': sharedPrefs.get(Constants.userId)});
    return processedResponse;
  }

  static Future<bool> assignBonus() async {
    final processedResponse = await postRequest(bonusEndPoint, headers: apiHeaders, body: {});
    return processedResponse['success'];
  }

  static Future<Map<String, dynamic>> getVersionControl() async {
    final processedResponse = await getRequest(versionControlEndPoint, headers: apiHeaders);
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> addConversion(final int amount) async {
    final processedResponse = await postRequest(cheapConversionEndPoint, headers: apiHeaders, body: {'amountGreen': amount * 4500, 'amountSilver': amount, 'userId': sharedPrefs.get(Constants.userId)});
    return processedResponse;
  }

  static Future<Map<String, dynamic>> sendUserAnswers(final List<Map<String, dynamic>> rawBody) async {
    final processedResponse = await postRequest(userAnswersEndPoint, headers: apiHeaders, body: rawBody);
    return processedResponse;
  }

  static Future<Map<String, dynamic>> postParticipant(final String tournamentId) async {
    final processedResponse = await postRequest(tournamentsParticipantsEndPoint, headers: apiHeaders, body: {'tournamentId': tournamentId, 'userId': sharedPrefs.get(Constants.userId)});
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> addHealthRecord(final Map<String, dynamic> cleanBody) async {
    final processedResponse = await postRequest(healthRecordEndPoint, headers: apiHeaders, body: cleanBody);
    return processedResponse;
  }

  static Future<Map<String, dynamic>?> getPastHealth() async {
    final processedResponse = await getRequest(healthRecordEndPoint, headers: apiHeaders, body: {'userId': sharedPrefs.get(Constants.userId)}, hidden: true);
    return processedResponse;
  }

  static Future<Map<String, dynamic>> refreshToken() async {
    final Map<String, dynamic> processedResponse = await postRequest(refreshTokenEndPoint, headers: apiHeaders, body: {'refreshToken': sharedPrefs.get(Constants.refreshToken), 'userId': sharedPrefs.get(Constants.userId)});
    return processedResponse;
  }
}
