import 'dart:math';

// Generate a random OTP
String generateOTP([int otpLength = 6]) {
  Random random = Random();
  String otp = '';

  for (int i = 0; i < otpLength; i++) {
    otp += random.nextInt(10).toString();
  }

  return otp;
}

/// Generate Avatar string from [multiavatar]
String generateAvatar() {
  String uuid = generateOTP();
  return 'https://api.multiavatar.com/${uuid}.png';
}
