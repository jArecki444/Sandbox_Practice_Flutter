import 'dart:io';

import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ComparePhotosSliderCard extends StatefulWidget {
  const ComparePhotosSliderCard({Key? key}) : super(key: key);

  @override
  State<ComparePhotosSliderCard> createState() =>
      _ComparePhotosSliderCardState();
}

class _ComparePhotosSliderCardState extends State<ComparePhotosSliderCard> {
  File? _pickedPhotoBefore;
  File? _pickedPhotoAfter;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              'Pick and compare photos from gallery / camera',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            Visibility(
              visible: _pickedPhotoBefore == null,
              child: Column(
                children: [
                  const Text(
                    'Pick first photo (before)',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _pickImage(
                            ImageSource.gallery, ComparedPhoto.before),
                        child: const Text(
                          'Gallery',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _pickImage(
                            ImageSource.camera, ComparedPhoto.before),
                        child: const Text(
                          'Camera',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Visibility(
              visible: _pickedPhotoAfter == null,
              child: Column(
                children: [
                  const Text(
                    'Pick second photo (after)',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _pickImage(
                            ImageSource.gallery, ComparedPhoto.after),
                        child: const Text(
                          'Gallery',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            _pickImage(ImageSource.camera, ComparedPhoto.after),
                        child: const Text('Camera'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_pickedPhotoAfter != null && _pickedPhotoBefore != null)
              Column(
                children: [
                  BeforeAfter(
                    beforeImage: Image.file(
                      _pickedPhotoBefore!,
                      fit: BoxFit.cover,
                      height: 500,
                      width: 500,
                    ),
                    afterImage: Image.file(
                      _pickedPhotoAfter!,
                      fit: BoxFit.cover,
                      height: 500,
                      width: 500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      _pickedPhotoBefore = null;
                      _pickedPhotoAfter = null;
                    }),
                    child: Text('Try again with new photos'),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future _pickImage(ImageSource sourceType, ComparedPhoto comparedPhoto) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: sourceType);
      if (pickedFile != null) {
        setState(() {
          if (comparedPhoto == ComparedPhoto.before) {
            _pickedPhotoBefore = File(pickedFile.path);
          } else {
            _pickedPhotoAfter = File(pickedFile.path);
          }
        });
      }
    } catch (e) {
      print('Failed to pick image $e');
    }
  }
}

enum ComparedPhoto {
  before,
  after,
}
