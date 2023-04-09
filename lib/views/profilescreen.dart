import 'dart:io';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? _image; // variable to store the selected image
  bool _editMode = false; // variable to keep track of edit mode
  final TextEditingController _nameController =
      TextEditingController(text: 'Your Name');
  final TextEditingController _emailController =
      TextEditingController(text: 'youremail@example.com');
  final TextEditingController _phoneController =
      TextEditingController(text: '+974 1234 5678');
  final TextEditingController _addressController =
      TextEditingController(text: '1234 Doha, Qatar');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _selectImage() async {
/*    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);*/
    setState(() {
      /*    if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _editMode = true;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _editMode ? _selectImage : null,
                child: CircleAvatar(
                  radius: 70,
                  //backgroundImage: _image != null ? FileImage(_image) : AssetImage('assets/images/profile.png'),
                  child: _editMode
                      ? Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.black54.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              readOnly: !_editMode,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              readOnly: !_editMode,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              readOnly: !_editMode,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _addressController,
              readOnly: !_editMode,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            SizedBox(height: 32),
            if (_editMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    minWidth: 100,
                    color: Colors.black,

                    onPressed: () {
                      // TODO: Implement
                      setState(() {
                        _editMode = false;
                      });
                    },
                    child: Text('Save',style: TextStyle(color: Colors.white),),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _editMode = false;
                      });
                    },
                    child: Text('Cancel',style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
