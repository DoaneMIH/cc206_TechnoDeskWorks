import 'dart:typed_data';

import 'package:exercisce_unit4/Services/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// import 'portfolio_provider.dart'; // Replace with the correct path

class AddPortfolioPage extends StatefulWidget {
  const AddPortfolioPage({super.key});

  @override
  State<AddPortfolioPage> createState() => _AddPortfolioPageState();
}

class _AddPortfolioPageState extends State<AddPortfolioPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _subtitle = "";
  String _description = "";
  Uint8List? _imageBytes;

  final ImagePicker _picker = ImagePicker();

  // Future<void> _pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() async {
  //       _imageBytes = Uint8List.fromList(await image.readAsBytes());
  //     });
  //   }
  // }

    // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    try {
      // Show a loading indicator while the image is being picked
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800, // Limit the width of the image
        maxHeight: 800, // Limit the height of the image
        imageQuality: 85, // Adjust image quality
      );

      if (image != null) {
        final Uint8List imageBytes = await image.readAsBytes();
        setState(() {
          _imageBytes = imageBytes;
        });
      } else {
        // If user cancels or doesn't select an image
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No image selected.")),
        );
      }
    } catch (e) {
      print("Error picking image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to pick image.")),
      );
    } finally {
      // Remove the loading indicator
      if (context.mounted) Navigator.of(context).pop();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Portfolio"), titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(207, 229, 251, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Title"),
                  onSaved: (value) => _title = value ?? "",
                  validator: (value) => value!.isEmpty ? "Enter a title" : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Subtitle"),
                  onSaved: (value) => _subtitle = value ?? "",
                  validator: (value) => value!.isEmpty ? "Enter a subtitle" : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Description"),
                  onSaved: (value) => _description = value ?? "",
                  validator: (value) => value!.isEmpty ? "Enter a description" : null,
                ),
                const SizedBox(height: 10),
                _imageBytes != null
                    ? Image.memory(_imageBytes!, 
                    height: 380,
                    width: double.infinity,
                    fit: BoxFit.cover,)
                    : const Text("No image selected"),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text("Pick Image"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(
                        context,
                        Portfolio(
                          title: _title,
                          subtitle: _subtitle,
                          description: _description,
                          imageBytes: _imageBytes,
                        ),
                      );
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

