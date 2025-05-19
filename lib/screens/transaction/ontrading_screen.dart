import 'package:flutter/material.dart';
import '../../dummy_data/items.dart';

class OnTradingScreen extends StatelessWidget {
  final String currentUserId = 'u01'; // 현재 로그인한 사용자 ID

  const OnTradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tradingItems = items.where((item) =>
      item['sellerId']==currentUserId || item['buyerId'] == currentUserId).toList();

      return ListView.builder(
            itemCount: tradingItems.length,
            itemBuilder: (context, index){
              final item = tradingItems[index];
              final isSold = item['status'] == 'sold';
              return Card(
                color: isSold ? Colors.grey[300] : Colors.white,
                child: ListTile(
                  title: Text(item['name']),
                  subtitle: Text('₩${item['price']} / 수량: ${item['quantity']}'),
                  trailing: Text(
                    item['status'],
                    style: TextStyle(
                      color: isSold ? Colors.grey[600] : Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                  )
                )
              );
            }
          );
    
  }
}


/* return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('hello ontrading'),
          
        ],
      ),
    );  */


