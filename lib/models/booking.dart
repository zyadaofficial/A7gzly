import 'court.dart';

class BookingSummary {
  final Court court;
  final DateTime date;
  final String timeSlot;
  final int hours;
  final double courtFee;
  final double serviceFee;

  const BookingSummary({
    required this.court,
    required this.date,
    required this.timeSlot,
    this.hours = 1,
    required this.courtFee,
    this.serviceFee = 10,
  });

  double get totalPrice => courtFee + serviceFee;
}

enum PaymentMethodType { card, wallet, instapay }

class PaymentMethod {
  final PaymentMethodType type;
  final String icon;
  final String label;
  final String subtitle;
  final bool isRecommended;

  const PaymentMethod({
    required this.type,
    required this.icon,
    required this.label,
    required this.subtitle,
    this.isRecommended = false,
  });

  static const List<PaymentMethod> options = [
    PaymentMethod(
      type: PaymentMethodType.card,
      icon: '\u{1F4B3}',
      label: 'Credit / Debit Card',
      subtitle: 'Visa, Mastercard, Meeza',
    ),
    PaymentMethod(
      type: PaymentMethodType.wallet,
      icon: '\u{1F4F1}',
      label: 'Vodafone Cash / Fawry',
      subtitle: 'Mobile wallet or Fawry code',
    ),
    PaymentMethod(
      type: PaymentMethodType.instapay,
      icon: '\u26A1',
      label: 'Paymob InstaPay',
      subtitle: 'Instant bank transfer',
      isRecommended: true,
    ),
  ];
}
