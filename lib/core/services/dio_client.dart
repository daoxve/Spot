import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spot/core/utils/exports.dart';

class DioClient {
  final Dio dio = Dio();
  final log = getLogger('NetworkStatus');

  Future getData({
    required String url,
    required BuildContext context,
    required void Function()? onSnackbarTap,
    required SnackbarService snackbarService,
  }) async {
    try {
      final response = await dio.get(url);

      final decodedResponse = jsonDecode(response.toString());
      return decodedResponse;
    } on DioError catch (e) {
      snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Okay',
        onMainButtonTapped: onSnackbarTap,
        onTap: onSnackbarTap,
        duration: const Duration(seconds: 3),
        message: 'Search failed!',
        variant: SnackbarType.failure,
      );

      log.e('Dio Error: ${e.response}');
    } on SocketException catch (e) {
      snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Okay',
        onMainButtonTapped: onSnackbarTap,
        onTap: onSnackbarTap,
        duration: const Duration(seconds: 3),
        message: 'Oops! A network error occured',
        variant: SnackbarType.failure,
      );

      log.e('Socket Error: $e');
    } on Exception catch (e) {
      snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Okay',
        onMainButtonTapped: onSnackbarTap,
        onTap: onSnackbarTap,
        duration: const Duration(seconds: 3),
        message: 'Oops! An error occured.',
        variant: SnackbarType.failure,
      );

      log.e('An Error: $e');
    } catch (e) {
      snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Okay',
        onMainButtonTapped: onSnackbarTap,
        onTap: onSnackbarTap,
        duration: const Duration(seconds: 3),
        message: 'Oops! Something went wrong.',
        variant: SnackbarType.failure,
      );

      log.e('Something went wrong : $e');
    }
  }
}
