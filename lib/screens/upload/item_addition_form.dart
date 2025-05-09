import 'package:flutter/material.dart';
import '../../widgets/textinput_form.dart';

class ItemAdditionForm extends StatefulWidget {
  final List<Map<String,dynamic>>? coSellers;
  final String currentUserId;
  
  const ItemAdditionForm({super.key, this.coSellers, required this.currentUserId});

  @override
  State<ItemAdditionForm> createState() => _ItemAdditionFormState();
}

class _ItemAdditionFormState extends State<ItemAdditionForm> {
  final List<int> _itemIds = [0]; 
  final Map<int, String?> _selectedSellerMap = {};
  int _idCounter = 1;

  void _addItemForm() {
    setState(() {
      _itemIds.add(_idCounter++);
    });
  }

  void _removeItemForm(int id) {
    if (_itemIds.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('물품은 최소 1개 이상이어야 합니다.'))
      );
      return;
    }

    setState(() {
      _itemIds.remove(id);
      _selectedSellerMap.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ..._itemIds.map((id) => _buildItemForm(id)),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _addItemForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.grey.shade300)
              ),
            ),
            child: const Icon(Icons.add, color: Colors.black)
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {
              for (final id in _itemIds) {
                final sellerId = _selectedSellerMap[id] ?? widget.currentUserId;
                print('Item $id의 판매자: $sellerId');
              }
              // 업로드 처리 로직 추가
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6562DF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Color(0xFF6562DF), width: 1.0),
              ),
              fixedSize: const Size(90, 50),
            ),
            child: const Text('업로드', style: TextStyle(color: Colors.white)),
          ),
        ),
        
      ],
    );
  }

  Widget _buildItemForm(int id) {
    final index = _itemIds.indexOf(id) + 1;
    final selectedSellerId = _selectedSellerMap[id];

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '물품$index',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextInputForm(hint: '물품명'),
                const SizedBox(height: 5),
                TextInputForm(hint: '가격₩', keyboardType: TextInputType.number),
                const SizedBox(height: 5),
                TextInputForm(
                  hint: '수량(default 1개)',
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) {
                    if (id == _itemIds.last)_addItemForm();
                  },
                ),
                const SizedBox(height: 8),
                if (widget.coSellers!.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('판매자 지정 (선택)', style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Wrap(
                    spacing: 8,
                    children: widget.coSellers!.map((user) {
                      final isSelected = selectedSellerId == user['id'];
                      return ChoiceChip(
                        label: Text(
                          user['name'],
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? const Color(0xFF6562DF) : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedSellerMap[id] = selected ? user['id'] : null;
                          });
                        },
                        showCheckmark: false,
                        selectedColor: Colors.white,
                        backgroundColor: Colors.white,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        side: BorderSide(
                          color: isSelected ? const Color(0xFF6562DF) : const Color(0xFFDCDCDC),
                        ),
                      );
                    }).toList(),
                  ),
                ]
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _removeItemForm(id),
            tooltip: '물품 삭제',
          ),
        ),
      ],
    );
  }
}
