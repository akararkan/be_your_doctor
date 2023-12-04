import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final _picker = ImagePicker();

  String _username = '';
  String _account = '';
  String _bio = '';
  String _location = '';
  String _phoneNumber = '';
  bool _isEditing = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: _isEditing ? _pickImage : null,
            child: CircleAvatar(
              radius: 120,
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? Icon(Icons.camera_alt, size: 80, color: Colors.white)
                  : null,
            ),
          ),
          SizedBox(height: 20),
          _buildProfileFormField('Username', _username, (value) => _username = value),
          _buildProfileFormField('Account', _account, (value) => _account = value),
          _buildProfileFormField('Bio', _bio, (value) => _bio = value),
          _buildProfileFormField('Location', _location, (value) => _location = value),
          _buildProfileFormField('Phone Number', _phoneNumber, (value) => _phoneNumber = value),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _isEditing ? Colors.blue : Colors.green,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _isEditing ? _saveProfileInformation : _enableEditing,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                _isEditing ? 'Save Profile' : 'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 200), // Added extra space at the bottom for keyboard overflow
        ],
      ),
    );
  }

  Widget _buildProfileFormField(String label, String value, Function(String) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        initialValue: _isEditing ? value : null,
        enabled: _isEditing,
        onChanged: _isEditing ? onChanged : null,
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _saveProfileInformation() {
    // Implement logic to save profile information to a database or perform other actions
    // You can access the entered values from _username, _account, _bio, _location, _phoneNumber, and _image
    // For simplicity, we'll just print the values for now
    print('Username: $_username');
    print('Account: $_account');
    print('Bio: $_bio');
    print('Location: $_location');
    print('Phone Number: $_phoneNumber');
    if (_image != null) {
      print('Image Path: ${_image!.path}');
    }

    // Disable editing after saving
    setState(() {
      _isEditing = false;
    });
  }

  void _enableEditing() {
    // Enable editing mode
    setState(() {
      _isEditing = true;
    });
  }
}
