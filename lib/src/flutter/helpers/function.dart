import 'dart:math';

/// Helper methods for generating OTPs and avatars
class Helpers {
  /// Generates a random OTP (One-Time Password)
  ///
  /// [otpLength] The length of the OTP to generate. Defaults to 6.
  /// Returns a string containing the generated OTP.
  static String generateOTP([int otpLength = 6]) {
    if (otpLength <= 0) {
      throw ArgumentError('OTP length must be greater than 0');
    }

    final random = Random.secure();
    return List.generate(otpLength, (_) => random.nextInt(10)).join();
  }

  /// Generates an avatar URL using the multiavatar API
  ///
  /// Returns a string containing the URL of the generated avatar.
  static String generateAvatar() {
    final uuid = generateOTP(10); // Using a longer OTP for more uniqueness
    return 'https://api.multiavatar.com/$uuid.png';
  }
}
