import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic> post;

  const ItemDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(
      post['items'] ?? [],
    );
    final sortedItems = List<Map<String, dynamic>>.from(items)..sort((a, b) {
      if (a['status'] == 'sold' && b['status'] != 'sold') return 1;
      if (a['status'] != 'sold' && b['status'] == 'sold') return -1;
      return 0;
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            /* title: Text(post['title'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                  )), */
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                post['image'],
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      color: Colors.grey,
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFCBCBFF),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 10),

                  Text(post['user']['name']),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(3),
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(text: post['user']['phone']),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('계좌번호가 복사되었습니다.')),
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.copy, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                post['user']['phone'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${post['title']}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(post['explanation']),
                  const SizedBox(height: 0),
                  Text(
                    '분류: ${post['category']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = sortedItems[index];
              final isSold = item['status'] == 'sold';

              final textStyle = TextStyle(
                fontSize: 12,
                color: isSold ? Colors.grey[600] : Colors.black,
              );

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 3,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color:
                          isSold
                              ? const Color.fromARGB(255, 234, 234, 234)
                              : Color(0xffcccbff),
                      width: 1,
                    ),
                  ),
                  elevation: 0,
                  color: isSold ? Colors.grey[200] : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          item['name'],
                                          style: textStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${item['price']} 원',
                                          style: textStyle.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '${item['quantity']}개, ${item['status']}',
                                          style: textStyle,
                                        ),
                                      ],
                                    ),

                                    //나중에 필요하면 쓸 코드
                                    /* if (item['buyer'] != null)
                                      Text('구매자: ${item['buyer']}', style: textStyle), */
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        onTap: isSold
                                          ? null  // 클릭 비활성화 (선택사항)
                                          : () {
                                              print('구매 버튼 클릭됨');
                                            };
                                        print('구매 버튼 클릭됨');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSold ? Colors.grey[500] : Color(0xff6562df),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          '구매',
                                          style: TextStyle(color: Colors.white.withValues(alpha: isSold ? 0.7 : 1.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: sortedItems.length),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 100), // 원하는 만큼 여백 조절
          ),
        ],
      ),
    );
  }
}
