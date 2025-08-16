import 'package:flutter/material.dart';
import '../models/donor.dart';
import '../data/sample_donors.dart';
import '../widgets/donor_list_item.dart';
import '../widgets/donor_details_dialog.dart';

class DonorListScreen extends StatefulWidget {
  const DonorListScreen({super.key});

  @override
  State<DonorListScreen> createState() => _DonorListScreenState();
}

class _DonorListScreenState extends State<DonorListScreen> {
  List<Donor> _allDonors = [];
  List<Donor> _filteredDonors = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _allDonors = SampleDonors.getDonors();
    _filteredDonors = _allDonors;
    _searchController.addListener(_filterDonors);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDonors() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredDonors = _allDonors;
      } else {
        _filteredDonors = _allDonors.where((donor) {
          return donor.name.toLowerCase().contains(query) ||
              donor.phone.toLowerCase().contains(query) ||
              donor.bloodGroup.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void _showDonorDetails(Donor donor) {
    showDialog(
      context: context,
      builder: (context) => DonorDetailsDialog(donor: donor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🩸 রক্তদাতার তালিকা',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red[700],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'নাম, ফোন বা রক্তের গ্রুপ দিয়ে খুঁজুন...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),
          
          // Results count
          if (_searchController.text.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${_filteredDonors.length} জন রক্তদাতা পাওয়া গেছে',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),
          
          // Donor list
          Expanded(
            child: _filteredDonors.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'কোন রক্তদাতা পাওয়া যায়নি',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'অন্য কিছু দিয়ে খোঁজ করে দেখুন',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredDonors.length,
                    itemBuilder: (context, index) {
                      final donor = _filteredDonors[index];
                      return DonorListItem(
                        donor: donor,
                        onTap: () => _showDonorDetails(donor),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}