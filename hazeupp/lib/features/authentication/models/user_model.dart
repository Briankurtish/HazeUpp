import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hazeupp/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Helper Function to get the Full name
  String get fullName => '$firstName $lastName';

  // Helper function to get format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // static function to split full name into first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to generate a username from the fullname
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; // combine first and last name
    String usernameWithPrefix = "hzup_$camelCaseUsername"; // add cwt_ prefix
    return usernameWithPrefix;
  }

  // Static function to return an empty user model
  static UserModel empty() => UserModel(
      id: "",
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  // Convert a UserModel into a Map. The keys must correspond to the names of the
  // fields in your database.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // A method that retrieves a UserModel instance from a Map.
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      profilePicture: map['profilePicture'],
    );
  }

  // Factory method to create a userModel from a Firebase Documnent Snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['Phoneumber'] ?? '',
        profilePicture: data['ProfileProfile'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  // A method that retrieves a UserModel instance from a JSON string.
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel{id: $id, firstName: $firstName, lastName: $lastName, username: $username, email: $email, phoneNumber: $phoneNumber, profilePicture: $profilePicture}';
  }
}
