import 'court.dart';

class MockData {
  static const List<Court> topCourts = [
    Court(
      id: '1',
      name: 'The Arena Sports Hub',
      imageUrl: 'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=800&q=80',
      rating: 4.9,
      reviewCount: 312,
      pricePerHour: 250,
      distance: '1.2 km',
      area: 'Smouha',
      type: 'football',
      isFavorite: true,
    ),
    Court(
      id: '2',
      name: 'Padel Zone Alexandria',
      imageUrl: 'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=800&q=80',
      rating: 4.8,
      reviewCount: 187,
      pricePerHour: 300,
      distance: '2.5 km',
      area: 'San Stefano',
      type: 'padel',
    ),
    Court(
      id: '3',
      name: 'Goal Centre',
      imageUrl: 'https://images.unsplash.com/photo-1575361204480-aadce3e14ed6?w=800&q=80',
      rating: 4.7,
      reviewCount: 245,
      pricePerHour: 200,
      distance: '3.1 km',
      area: 'Gleem',
      type: 'football',
    ),
    Court(
      id: '4',
      name: 'Smash Padel Club',
      imageUrl: 'https://images.unsplash.com/photo-1526232761682-d26e03ac148e?w=800&q=80',
      rating: 4.6,
      reviewCount: 98,
      pricePerHour: 350,
      distance: '4.0 km',
      area: 'Mandara',
      type: 'padel',
    ),
  ];

  static const List<FlashSlot> flashSlots = [
    FlashSlot(
      courtName: 'The Arena',
      imageUrl: 'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=400&q=80',
      timeSlot: '8:00 PM',
      originalPrice: 250,
      discountedPrice: 180,
      slotsLeft: 1,
      isHighDemand: true,
    ),
    FlashSlot(
      courtName: 'Padel Zone',
      imageUrl: 'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=400&q=80',
      timeSlot: '9:00 PM',
      originalPrice: 300,
      discountedPrice: 220,
      slotsLeft: 2,
    ),
    FlashSlot(
      courtName: 'Goal Centre',
      imageUrl: 'https://images.unsplash.com/photo-1575361204480-aadce3e14ed6?w=400&q=80',
      timeSlot: '7:30 PM',
      originalPrice: 200,
      discountedPrice: 150,
      slotsLeft: 1,
      isHighDemand: true,
    ),
    FlashSlot(
      courtName: 'Smash Padel',
      imageUrl: 'https://images.unsplash.com/photo-1526232761682-d26e03ac148e?w=400&q=80',
      timeSlot: '10:00 PM',
      originalPrice: 350,
      discountedPrice: 280,
      slotsLeft: 3,
    ),
  ];
}
