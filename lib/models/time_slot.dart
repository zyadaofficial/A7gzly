enum SlotStatus { available, booked }

class TimeSlot {
  final String time;
  final SlotStatus status;

  const TimeSlot({
    required this.time,
    this.status = SlotStatus.available,
  });
}

class Amenity {
  final String icon;
  final String label;

  const Amenity({required this.icon, required this.label});
}

class VenueMockData {
  static const List<Amenity> amenities = [
    Amenity(icon: '\u{1F6BF}', label: 'Showers'),
    Amenity(icon: '\u{1F17F}', label: 'Parking'),
    Amenity(icon: '\u{1F964}', label: 'Cafe'),
    Amenity(icon: '\u{1F4A1}', label: 'Floodlights'),
    Amenity(icon: '\u{1F455}', label: 'Jerseys'),
    Amenity(icon: '\u{1F4F6}', label: 'Wi-Fi'),
  ];

  static const List<TimeSlot> timeSlots = [
    TimeSlot(time: '12:00 AM'),
    TimeSlot(time: '01:00 AM'),
    TimeSlot(time: '02:00 AM'),
    TimeSlot(time: '03:00 AM'),
    TimeSlot(time: '04:00 AM'),
    TimeSlot(time: '05:00 AM'),
    TimeSlot(time: '06:00 AM'),
    TimeSlot(time: '07:00 AM'),
    TimeSlot(time: '08:00 AM'),
    TimeSlot(time: '09:00 AM'),
    TimeSlot(time: '10:00 AM'),
    TimeSlot(time: '11:00 AM'),
    TimeSlot(time: '12:00 PM'),
    TimeSlot(time: '01:00 PM'),
    TimeSlot(time: '02:00 PM'),
    TimeSlot(time: '03:00 PM'),
    TimeSlot(time: '04:00 PM'),
    TimeSlot(time: '05:00 PM', status: SlotStatus.booked),
    TimeSlot(time: '06:00 PM'),
    TimeSlot(time: '07:00 PM', status: SlotStatus.booked),
    TimeSlot(time: '08:00 PM'),
    TimeSlot(time: '09:00 PM'),
    TimeSlot(time: '10:00 PM', status: SlotStatus.booked),
    TimeSlot(time: '11:00 PM'),
  ];
}
