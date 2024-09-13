import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatService {
  RevenueCatService({
    required String iosApiKey,
    required String androidApiKey,
  })  : _iosApiKey = iosApiKey,
        _androidApiKey = androidApiKey;

  final String _iosApiKey;
  final String _androidApiKey;

  Future<void> initialize() async {
    try {
      await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.info);

      PurchasesConfiguration configuration;
      if (Platform.isAndroid) {
        configuration = PurchasesConfiguration(
          _androidApiKey,
        );
      } else if (Platform.isIOS) {
        configuration = PurchasesConfiguration(
          _iosApiKey,
        );
      } else {
        throw UnsupportedError('Unsupported platform');
      }

      await Purchases.configure(configuration);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        RevenueCatServiceException(
          message: 'Failed to initialize RevenueCat.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> identifyUser(String userId) async {
    try {
      final purchasesIsConfigured = await Purchases.isConfigured;
      if (!purchasesIsConfigured) {
        throw StateError('RevenueCat is not configured');
      }

      final userIdIsAnonymous = await Purchases.isAnonymous;
      if (userIdIsAnonymous) {
        await Purchases.logIn(userId);
      }
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        RevenueCatServiceException(
          message: 'Failed to identify user.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<void> logOutUser() async {
    try {
      await Purchases.logOut();
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        RevenueCatServiceException(
          message: 'Failed to log out user.',
          cause: e,
        ),
        stackTrace,
      );
    }
  }
}

class RevenueCatServiceException implements Exception {
  RevenueCatServiceException({required this.message, this.cause});

  final String message;
  final dynamic cause;

  @override
  String toString() => 'RevenueCatServiceException: '
      '$message${cause != null ? ' (Cause: $cause)' : ''}';
}
