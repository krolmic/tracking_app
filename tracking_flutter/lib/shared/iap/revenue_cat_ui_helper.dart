import 'package:flutter/services.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class RevenueCatUIHelper {
  RevenueCatUIHelper._();

  static Future<void> showPaywallIfNecessary({
    required VoidCallback requiresSubscriptionCallback,
    required VoidCallback onPurchased,
    required VoidCallback onRestored,
    required VoidCallback onError,
  }) async {
    try {
      final result = await RevenueCatUI.presentPaywallIfNeeded(
        'premium',
        displayCloseButton: true,
      );

      switch (result) {
        case PaywallResult.purchased:
          onPurchased();
          requiresSubscriptionCallback();
        case PaywallResult.restored:
          onRestored();
          requiresSubscriptionCallback();
        case PaywallResult.notPresented:
          requiresSubscriptionCallback();
        case PaywallResult.error:
          onError();
          Fimber.e('Paywall presentation error');
        case PaywallResult.cancelled:
          break;
      }
    } catch (e) {
      onError();
      Fimber.e(
        'Unexpected error in RevenueCatUIHelper.showPaywallIfNecessary',
        ex: e,
      );
    }
  }
}
