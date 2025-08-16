class Donor {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String bloodGroup;
  final String imageUrl;
  final DateTime lastDonationDate;

  Donor({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.bloodGroup,
    required this.imageUrl,
    required this.lastDonationDate,
  });

  // Helper method to format last donation date
  String get formattedLastDonationDate {
    return "${lastDonationDate.day}/${lastDonationDate.month}/${lastDonationDate.year}";
  }
}