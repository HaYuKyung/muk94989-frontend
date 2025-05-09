import 'package:flutter/material.dart';
import '../../dummy_data/users.dart';


class CoSellerSelector extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onSelectedChanged;

  const CoSellerSelector({super.key, required this.onSelectedChanged});

  @override
  State<CoSellerSelector> createState() => _CoSellerSelectorState();
}

class _CoSellerSelectorState extends State<CoSellerSelector> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _selectedCoSellers = [];
  List<Map<String, dynamic>> _filteredUsers = [];
  

  void _filterUsers(String input) {
    setState(() {
      _filteredUsers = users
          .where((user) =>
              user['name'].toLowerCase().contains(input.toLowerCase()) &&
              !_selectedCoSellers.any((sel) => sel['id'] == user['id']))
          .toList();
    });
  }

  void _selectUser(Map<String, dynamic> user) {
    setState(() {
      _selectedCoSellers.add(user);
      _controller.clear();
      _filteredUsers.clear();
      widget.onSelectedChanged(_selectedCoSellers);
    });
  }

  void _removeUser(String id) {
    setState(() {
      _selectedCoSellers.removeWhere((u) => u['id'] == id);
      widget.onSelectedChanged(_selectedCoSellers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(hintText: '공동판매자 이름 입력'),
          onChanged: _filterUsers,
        ),
        if (_filteredUsers.isNotEmpty && _controller.text.trim().isNotEmpty)
          ..._filteredUsers.map((user) => ListTile(
                title: Text(user['name']),
                onTap: () => _selectUser(user),
              )),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: _selectedCoSellers.map((user) {
            return InputChip(
              label: Text(
                user['name'],
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF6562DF),
                ),
              ),
              onDeleted: () => _removeUser(user['id']),
              deleteIcon: const Icon(Icons.close, size: 16),
              showCheckmark: false,
              selected: true,
              selectedColor: Colors.white,
              backgroundColor: Colors.white,
              labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              side: const BorderSide(color: Color(0xFF6562DF)),
            );
          }).toList(),
        )

      ],
    );
  }
}
