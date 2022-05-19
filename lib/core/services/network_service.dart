import 'dart:convert';
import 'dart:io';

import 'package:spot/core/utils/exports.dart';

class NetworkService {
  final Dio dio = Dio();
  final log = getLogger('NetworkService');

  Future getData({
    required String url,
    required BuildContext context,
    required SnackbarWrapperService snackbarService,
  }) async {
    try {
      final response = await dio.get(url);

      final decodedResponse = jsonDecode(response.toString());
      return decodedResponse;
    } on DioError catch (e) {
      snackbarService.pushCustomPopup(
        context,
        message: 'Search failed!',
      );

      log.e('Dio Error: ${e.response}');
    } on SocketException catch (e) {
      snackbarService.pushCustomPopup(
        context,
        message: 'Oops! A network error occured',
      );

      log.e('Socket Error: $e');
    } on Exception catch (e) {
      snackbarService.pushCustomPopup(
        context,
        message: 'Oops! An error occured',
      );

      log.e('An Error: $e');
    } catch (e) {
      snackbarService.pushCustomPopup(
        context,
        message: 'Oops! Something went wrong.',
      );

      log.e('Something went wrong : $e');
    }
  }
}
