import 'dart:math';

/// Helper methods
class Helpers {
  // Generate a random OTP
  static String generateOTP([int otpLength = 6]) {
    Random random = Random();
    String otp = '';

    for (int i = 0; i < otpLength; i++) {
      otp += random.nextInt(10).toString();
    }

    return otp;
  }

  /// Generate Avatar string from [multiavatar]
  static String generateAvatar() {
    String uuid = generateOTP();
    return 'https://api.multiavatar.com/${uuid}.png';
  }
}
