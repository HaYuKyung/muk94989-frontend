/* import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploadForm extends StatefulWidget {
  const ImageUploadForm({super.key});

  @override
  ImageUploadFormState createState() => ImageUploadFormState();
}

class ImageUploadFormState extends State<ImageUploadForm> {
  final List<XFile> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('갤러리에서 선택'),
              onTap: () async {
                final result = await _picker.pickImage(source: ImageSource.gallery);
                Navigator.pop(context, result);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('카메라로 촬영'),
              onTap: () async {
                final result = await _picker.pickImage(source: ImageSource.camera);
                Navigator.pop(context, result);
              },
            ),
          ],
        ),
      ),
    );

    if (picked != null) {
      setState(() {
        _images.add(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // ➕ 이미지 추가 버튼
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color.fromARGB(255, 190, 190, 190)),
              ),
              child: const Icon(Icons.add_a_photo_outlined, size: 25),
            ),
          ),

          ..._images.asMap().entries.map((entry) {
            final index = entry.key;
            final image = entry.value;

            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color.fromARGB(255, 200, 200, 200)),
                    image: DecorationImage(
                      image: FileImage(File(image.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _images.removeAt(index);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
 */