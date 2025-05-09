import 'package:flutter/material.dart';
import '../../widgets/textinput_form.dart';
//import 'image_upload_form.dart';

//import 'package:multi_select_flutter/multi_select_flutter.dart';

class WantToBuyForm extends StatefulWidget {
  const WantToBuyForm({super.key});

  @override
  State<WantToBuyForm> createState() => _WantToBuyFormState();
}

class _WantToBuyFormState extends State<WantToBuyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey, // 유효성 검사 시 사용
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image upload ui
            //ImageUploadForm(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text('게시물 설명', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextInputForm(
              hint: '제목',
              maxLines: 3,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? '제목을 입력하세요' : null,
            ),
            const SizedBox(height: 5),
            TextInputForm(hint: '추가설명', maxLines: null, minLines: 3, keyboardType: TextInputType.multiline),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // upload logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6562DF),//const Color(0xFF6562DF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Color(0xFF6562DF),
                          width: 1.0,
                        ),
                      ),
                      fixedSize: Size(90, 50)
                    ),
                    child: const Text('업로드', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
