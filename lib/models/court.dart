class Court {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final double pricePerHour;
  final String distance;
  final String area;
  final String type; // 'football' or 'padel'
  final bool isFavorite;

  const Court({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.pricePerHour,
    required this.distance,
    required this.area,
    required this.type,
    this.isFavorite = false,
  });
}

class FlashSlot {
  final String courtName;
  final String imageUrl;
  final String timeSlot;
  final double originalPrice;
  final double discountedPrice;
  final int slotsLeft;
  final bool isHighDemand;

  const FlashSlot({
    required this.courtName,
    required this.imageUrl,
    required this.timeSlot,
    required this.originalPrice,
    required this.discountedPrice,
    required this.slotsLeft,
    this.isHighDemand = false,
  });
}
