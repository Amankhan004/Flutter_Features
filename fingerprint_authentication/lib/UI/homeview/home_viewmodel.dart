import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  String get authorized => _authorized;
  _SupportState get supportState => _supportState;

  Future<void> onViewModelReady() async {
    try {
      bool isSupported = await auth.isDeviceSupported();
      _supportState =
          isSupported ? _SupportState.supported : _SupportState.unsupported;
      notifyListeners(); // Notify UI of changes
    } on PlatformException catch (e) {
      print(e);
      // Handle exception if needed
    }
  }

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
      _canCheckBiometrics = canCheckBiometrics;
      notifyListeners(); // Notify UI of changes
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
      // Handle exception if needed
    }
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      _availableBiometrics = availableBiometrics;
      notifyListeners(); // Notify UI of changes
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
      // Handle exception if needed
    }
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      setBusy(true); // Indicate that the ViewModel is busy
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to Authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setBusy(false); // ViewModel is no longer busy
    } on PlatformException catch (e) {
      print(e);
      setBusy(false); // Handle exceptions, ViewModel is no longer busy
      _authorized = 'Error - ${e.message}';
      notifyListeners(); // Notify UI of changes
      return;
    }

    // Update authorized state based on authentication result
    _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    notifyListeners(); // Notify UI of changes
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
