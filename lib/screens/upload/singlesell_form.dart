import 'package:flutter/material.dart';
import '../../assets/categories.dart';
import '../../widgets/textinput_form.dart';
import 'item_addition_form.dart';
//import 'image_upload_form.dart';

//import 'package:multi_select_flutter/multi_select_flutter.dart';

class SingleSellForm extends StatefulWidget {
  const SingleSellForm({super.key});

  @override
  State<SingleSellForm> createState() => _SingleSellFormState();
}

class _SingleSellFormState extends State<SingleSellForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _selectedCategories = [];

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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: const Text('카테고리', style: TextStyle(fontWeight: FontWeight.bold)),
            ), 
            Wrap(
              spacing: 8,
              children:
                  categories.map((category) {
                    final isSelected = _selectedCategories.contains(category);
                    return ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedCategories.add(category);
                          } else {
                            _selectedCategories.remove(category);
                          }
                        });
                      },
                      showCheckmark: false,
                      selectedColor: Colors.white,
                      backgroundColor: Colors.white, // <- 여기 색 어떻게 할지 고민중
                      //surfaceTintColor: Colors.white,
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 1,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 12,
                        color: isSelected ? const Color(0xFF6562DF) : Colors.black,
                      ),
                      side: BorderSide(color: isSelected ? const Color(0xFF6562DF) : Color.fromARGB(255, 220, 220, 220)),
                    );
                  }).toList(),
            ),
            SizedBox(height: 40),
            ItemAdditionForm(currentUserId: 'myself', coSellers: []),
            SizedBox(height: 80),

          ],
        ),
      ),
    );
  }
}
