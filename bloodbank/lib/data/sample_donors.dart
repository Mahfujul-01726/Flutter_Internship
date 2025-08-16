import '../models/donor.dart';

class SampleDonors {
  static List<Donor> getDonors() {
    return [
      Donor(
        name: "রাহিম উদ্দিন",
        email: "rahim@email.com",
        phone: "+8801711000001",
        address: "ধানমন্ডি, ঢাকা",
        bloodGroup: "A+",
        imageUrl: "assets/images/donor1.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 1, 15),
      ),
      Donor(
        name: "ফাতেমা খাতুন",
        email: "fatema@email.com",
        phone: "+8801711000002",
        address: "গুলশান, ঢাকা",
        bloodGroup: "B+",
        imageUrl: "assets/images/donor2.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 2, 20),
      ),
      Donor(
        name: "করিম আহমেদ",
        email: "karim@email.com",
        phone: "+8801711000003",
        address: "বনানী, ঢাকা",
        bloodGroup: "O+",
        imageUrl: "assets/images/donor3.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 3, 10),
      ),
      Donor(
        name: "সালমা বেগম",
        email: "salma@email.com",
        phone: "+8801711000004",
        address: "মিরপুর, ঢাকা",
        bloodGroup: "AB+",
        imageUrl: "assets/images/donor4.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 1, 25),
      ),
      Donor(
        name: "আব্দুল হাকিম",
        email: "hakim@email.com",
        phone: "+8801711000005",
        address: "উত্তরা, ঢাকা",
        bloodGroup: "A-",
        imageUrl: "assets/images/donor5.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 2, 5),
      ),
      Donor(
        name: "রোকেয়া আক্তার",
        email: "rokeya@email.com",
        phone: "+8801711000006",
        address: "মোহাম্মদপুর, ঢাকা",
        bloodGroup: "B-",
        imageUrl: "assets/images/donor6.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 3, 1),
      ),
      Donor(
        name: "মোহাম্মদ আলী",
        email: "ali@email.com",
        phone: "+8801711000007",
        address: "রমনা, ঢাকা",
        bloodGroup: "O-",
        imageUrl: "assets/images/donor7.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 1, 30),
      ),
      Donor(
        name: "নাসরিন সুলতানা",
        email: "nasrin@email.com",
        phone: "+8801711000008",
        address: "পান্থপথ, ঢাকা",
        bloodGroup: "AB-",
        imageUrl: "assets/images/donor8.jpg", // You can replace with actual photo
        lastDonationDate: DateTime(2024, 2, 15),
      ),
    ];
  }
}