import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../../services/api_services.dart';
import '../Edit_Blindness_Test/edit_blindness.dart';

class DeleteBlindImagePage extends StatelessWidget {
  final CameraDescription frontCamera;
  final String imageUrl;



  const DeleteBlindImagePage({super.key,  required this.imageUrl, required this.frontCamera});
  Future<void> _showDeleteConfirmationDialog(context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete ok!'),
          content: const Text('Successfully deleted...'),
          actions: <Widget>[

            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(

                    builder: (context) =>  EditBlindness(frontCamera: frontCamera,),
                  ),
                ); // Close the dialog
                // Delete the image
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController textAnswerController = TextEditingController();
    final MyApiService apiService = MyApiService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Image'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imageUrl), // Display the image
              // const Text('Are you sure you want to delete this image?'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width:200,
                child: TextFormField(
                  controller: textAnswerController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Answer',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Close this page and delete the image
                  apiService.deleteBlindImageDataFromFirestore(imageUrl);
                  apiService.deleteBlindValueFromFirestore(textAnswerController.text);
                  _showDeleteConfirmationDialog(context);


                },
                child: const Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
