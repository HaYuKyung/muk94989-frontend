import 'package:flutter/material.dart';
import '../../assets/categories.dart';
import '../../widgets/textinput_form.dart';
import 'item_addition_form.dart';
import 'coseller_selector_form.dart';
import '../../dummy_data/users.dart';
//import 'package:multi_select_flutter/multi_select_flutter.dart';

class GroupSellForm extends StatefulWidget {
  const GroupSellForm({super.key});

  @override
  State<GroupSellForm> createState() => _GroupSellFormState();
}

class _GroupSellFormState extends State<GroupSellForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _selectedCategories = [];
  List<Map<String, dynamic>>? coSellers = [];

  void updateCoSellers(List<Map<String,dynamic>> selectedUsers){
    setState(() {
      coSellers = selectedUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey, // 유효성 검사에 사용함
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image upload ui
            /* GestureDetector(
              onTap: () {
                // 이미지 추가 로직 (image_picker 등)
              },
              child: Container( // 있으면 더 좋음. 없으면 Container만 사용해도 됨
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                //color: Colors.grey,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_a_photo_outlined, size: 40),
                      SizedBox(height: 8),
                      Text('이미지 추가'),
                    ],
                  ),
                ),
              ),
            ),
 */
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                '게시물 설명',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextInputForm(
              hint: '제목',
              maxLines: 3,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? '제목을 입력하세요' : null,
            ),
            const SizedBox(height: 5),
            TextInputForm(
              hint: '추가설명',
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: const Text(
                '카테고리',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                        color:
                            isSelected ? const Color(0xFF6562DF) : Colors.black,
                      ),
                      side: BorderSide(
                        color:
                            isSelected
                                ? const Color(0xFF6562DF)
                                : Color.fromARGB(255, 220, 220, 220),
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                '공동 판매자',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CoSellerSelector(onSelectedChanged: updateCoSellers),
            SizedBox(height: 40),
            ItemAdditionForm(coSellers: coSellers ?? [], currentUserId: 'myself'),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
