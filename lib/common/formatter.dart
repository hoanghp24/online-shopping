import 'package:intl/intl.dart';

class Formatter {
  static String formatDateTime(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy, HH:mm:ss');
    return dateFormat.format(dateTime);
  }

  static String formatCurrency(int amount) {
    String formattedAmount = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ')
        .format(amount); //Customize the currency locale and symbol as needed
    return formattedAmount.replaceAll('\u00A0', '');
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-789
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    // Add more custom phone number formatting logic for different formats if needed
    return phoneNumber;
  }

  // Not fully tested
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write('');
      }
      i = end;
    }
    return formattedNumber.toString();
  }

  static String formatNumberSale(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return number.toString();
    }
  }
}
