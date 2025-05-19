import 'package:flutter/material.dart';
import '../../assets/categories.dart';
import '../../widgets/title_bar.dart';
import 'item_detail_screen.dart';
import '../../dummy_data/posts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = '전체';

  // temporary datas
/*   final List<Map<String, dynamic>> posts = [
  {
    'image': 'https://via.placeholder.com/150',
    'title': '간식 대방출합니다! 😋',
    'user': '28기 하유경',
    'category': '음식',
    'explanation': '기숙사 정리하면서 남은 간식들 저렴하게 나눔합니다!',
    'items': [
      {
        'name': '오징어 땅콩',
        'price': 1000,
        'quantity': 2,
        'status': 'available',
        'buyer': null,
      },
      {
        'name': '초코파이',
        'price': 500,
        'quantity': 5,
        'status': 'reserved',
        'buyer': '29기 이수현',
      },
    ],
  },
  {
    'image': 'https://via.placeholder.com/150',
    'title': '교재 한가득!',
    'user': '28기 김민수',
    'category': '교재',
    'explanation': '학기 끝나서 필요 없는 교재 정리해요.',
    'items': [
      {
        'name': '미적분 교재',
        'price': 3000,
        'quantity': 1,
        'status': 'sold',
        'buyer': '28기 하유경',
      },
    ],
  },
  {
    'image': 'https://via.placeholder.com/150',
    'title': '교복 나눔합니다!',
    'user': '27기 박지현',
    'category': '교복',
    'explanation': '사이즈가 안 맞아서 안 입은 하복 셔츠 나눔합니다. 여름 동안 보관 잘 했고, 거의 새 거예요. 필요하신 분 챗 주세요!',
    'items': [
      {
        'name': '하복 셔츠',
        'price': 0,
        'quantity': 2,
        'status': 'available',
        'buyer': null,
      },
    ],
  },
  {
    'image': 'https://via.placeholder.com/150',
    'title': '달달한 과자 나눠요 🍭',
    'user': '29기 송하린',
    'category': '음식',
    'explanation': '과자 선물 많이 받아서 나눠요!',
    'items': [
      {
        'name': '캔디세트',
        'price': 1500,
        'quantity': 3,
        'status': 'available',
        'buyer': null,
      },
    ],
  },
  {
    'image': 'https://via.placeholder.com/150',
    'title': '중간고사 대비 교재 팝니다 📚',
    'user': '28기 이재현',
    'category': '교재',
    'explanation': '''중간고사 준비하면서 정말 유용하게 사용했던 교재입니다.
메모도 깔끔하게 되어 있고, 중요 부분 표시도 있어요.
필요하신 분에게 잘 전달되면 좋겠습니다.''',
    'items': [
      {
        'name': '영어 기출문제집',
        'price': 2000,
        'quantity': 1,
        'status': 'reserved',
        'buyer': '30기 김도현',
      },
    ],
  },
  {
    'image': 'https://via.placeholder.com/150',
    'title': '겨울 교복 무료로 드려요 ❄️',
    'user': '27기 김서윤',
    'category': '교복',
    'explanation': '''겨울 점퍼 하나 남아서 올려요.
세탁 완료했고, 안감 상태 아주 좋아요.
사이즈는 M이며 여유 있게 입을 수 있습니다.
무료로 드리니 필요하신 분 연락주세요!''',
    'items': [
      {
        'name': '겨울 점퍼',
        'price': 0,
        'quantity': 1,
        'status': 'available',
        'buyer': null,
      },
    ],
  },
  {
    'image': 'https://via.placeholder.com/150',
    'title': '붕어빵 드실 분? 🐟',
    'user': '30기 전유진',
    'category': '음식',
    'explanation': '''오늘 붕어빵 장사하다가 남은 거 나눠요.
팥, 슈크림 모두 있고 따뜻하게 보관 중입니다.
근처 분들 챗 주세요. 수량 한정입니다!
맛은 보장해요 😄''',
    'items': [
      {
        'name': '팥붕어빵',
        'price': 1000,
        'quantity': 3,
        'status': 'sold',
        'buyer': '29기 정예린',
      },
      {
        'name': '슈크림붕어빵',
        'price': 1200,
        'quantity': 2,
        'status': 'available',
        'buyer': null,
      },
    ],
  },
  {
    'image': 'https://via.placeholder.com/150',
    'title': '기말 끝났으니 교재 처분합니다!',
    'user': '28기 박우성',
    'category': '교재',
    'explanation': '''기말 대비로 열심히 풀었던 문제집입니다.
필기 깨끗하게 되어 있고, 정리도 잘 되어 있어요.
중간기말 통합 문제집이라 학기 마무리용으로 좋아요.
가격도 저렴하게 책정했으니 부담 없이 챗 주세요.''',
    'items': [
      {
        'name': '기말 종합문제집',
        'price': 2500,
        'quantity': 1,
        'status': 'available',
        'buyer': null,
      },
    ],
  },
];
 */


  @override
  Widget build(BuildContext context) {
    final filteredPosts =
        selectedCategory == '전체'
            ? posts
            : posts.where((p) => (p['category'] as List).contains(selectedCategory)).toList();


    return Scaffold(
      //appbar
      appBar: TitleBar(title: '전체보기'),
      body: Column(
        children: [
          //category
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(), //필요없으면 제거!!
              child: Row(
                children:
                    ['전체', ...categories].map((category) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 5, left: 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedCategory == category? Color(0xFF6562DF) : Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            side: BorderSide(color: Color.fromARGB(255, 220, 220, 220)),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                            minimumSize: const Size(0, 38),
                            elevation: 0,
                          ),
                          onPressed: () { setState(() {selectedCategory = category;});},
                          child: Text(
                            category,
                            style: TextStyle(
                              color: selectedCategory == category? Colors.white : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
          // list of posts
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: filteredPosts.length,
              separatorBuilder:
                  (_, __) => const Divider(color: Color(0xFFDDDDDD)),
              itemBuilder: (context, index) {
                final post = filteredPosts[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ItemDetailScreen(post: post),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          post['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: const Color.fromARGB(255, 202, 202, 202),
                              child: Icon(Icons.broken_image),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post['title'],
                              style: const TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Wrap(
                              spacing: 6,
                              runSpacing: 4,
                              children: (post['category'] as List<dynamic>)
                                    .map<Widget>((category) => Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEDEBFF),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            category,
                                            style: const TextStyle(fontSize: 12, color: Colors.black87),
                                          ),
                                        ))
                                    .toList(),
                              /* (post['items'] as List<dynamic>)
                                  .where((item) => item['quantity'] > 0)
                                  .map<Widget>((item) => Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEDEBFF),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          item['name'],
                                          style: const TextStyle(fontSize: 11, color: Colors.black87),
                                        ),
                                      ))
                                  .toList(), */ //수량이 0이 아닌 아이템들의 이름을 띄워주는 코드!
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Color(0xFFCBCBFF),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  post['user']['name'],
                                  style: const TextStyle(color: Color.fromARGB(255, 101, 101, 101), fontSize: 14),
                                ),
                                SizedBox(width:5)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      
    );
  }
}

