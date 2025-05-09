import 'package:flutter/material.dart';
import '../../dummy_data/posts.dart';

class OnTradingScreen extends StatelessWidget {
  final String currentUserId = 'u01'; // 현재 로그인한 사용자 ID

  const OnTradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tradingItems = posts.expand((post) {
      return post['items'].where((item) {
        final isMine = item['sellerId'] == currentUserId;
        final isRequested = item['buyerId'] == currentUserId;
        final isOngoing = item['status'] != 'sold';
        return (isMine || isRequested) && isOngoing;
      }).map((item) => {
        'postTitle': post['title'],
        'postImage': post['image'],
        'postUser': post['user'],
        'item': item,
      });
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('현재 거래중인 물품')),
      body: tradingItems.isEmpty
          ? const Center(child: Text('거래중인 물품이 없습니다.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: tradingItems.length,
              itemBuilder: (context, index) {
                final data = tradingItems[index];
                final item = data['item'];
                final isMine = item['sellerId'] == currentUserId;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Image.network(
                      data['postImage'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text('${item['name']} (${item['quantity']}개)'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('₩ ${item['price']}'),
                        Text(isMine
                            ? '요청자: ${item['buyerId'] ?? '없음'}'
                            : '판매자: ${data['postUser']['name']}'),
                      ],
                    ),
                    trailing: Text(
                      item['status'],
                      style: TextStyle(
                        color: item['status'] == 'available'
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
