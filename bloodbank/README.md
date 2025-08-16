# 🩸 Blood Bank App - Complete Implementation

A comprehensive Flutter application for managing blood donors with search functionality and detailed donor information.

## ✅ Features Implemented

### 1. Donor List Page
- Scrollable list using `ListView.builder`
- Each donor item displays:
  - Circular avatar with donor image (`CircleAvatar`)
  - Name in Bengali format: "নাম: [Name]"
  - Phone in Bengali format: "ফোন: [Phone]"
  - Color-coded blood group badge in top-right corner

### 2. Donor Details Dialog
- Tap any donor to open detailed popup (`AlertDialog`)
- Large donor image (bigger `CircleAvatar`)
- Complete donor information:
  - Name, Email, Address
  - Clickable phone number (makes actual phone calls)
  - Last donation date
  - Highlighted blood group with larger text

### 3. Search Feature
- Search bar at the top with Bengali placeholder text
- Real-time filtering by:
  - Name
  - Phone number
  - Blood group
- Results counter
- Clear search button
- Empty state with helpful message

### 4. Technical Implementation
- Clean architecture with separate models, widgets, and screens
- Proper state management with `StatefulWidget`
- Color-coded blood groups (A+/A-: Red, B+/B-: Blue, AB+/AB-: Purple, O+/O-: Green)
- Responsive UI with proper spacing and Material Design
- Bengali text support throughout the app

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/
│   └── donor.dart              # Donor data model
├── data/
│   └── sample_donors.dart      # Sample donor data (8 donors)
├── widgets/
│   ├── donor_list_item.dart    # Individual donor list item
│   └── donor_details_dialog.dart # Donor details popup
└── screens/
    └── donor_list_screen.dart  # Main donor list screen
```

## 🎨 UI Features

- Red theme matching blood bank concept
- Bengali text throughout the interface
- Smooth animations and transitions
- Material Design components
- Responsive layout
- Professional color scheme

## 📱 Sample Data

- 8 sample donors with Bengali names
- Local Dhaka addresses
- Realistic phone numbers
- Various blood groups
- Different donation dates
- Placeholder images with initials

## 🔧 Dependencies Added

- `url_launcher: ^6.2.4` for phone call functionality

## Blood Group Color Coding

- **A+/A-**: Red
- **B+/B-**: Blue
- **AB+/AB-**: Purple
- **O+/O-**: Green

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

## Phone Call Feature

Tap on any phone number in the donor details dialog to make a direct call (requires phone capability on the device).

## Technical Specifications

- **Framework**: Flutter (latest stable)
- **UI Components**:
  - `ListView.builder` for efficient donor list rendering
  - `AlertDialog` for donor details popup
  - `CircleAvatar` for donor images
  - `TextField` for search functionality
- **Architecture**:
  - Clean separation of models, widgets, and screens
  - Sample data with Bengali names and local addresses
  - Proper state management and responsive design

The app is ready to run with all requested features implemented using Flutter best practices!
