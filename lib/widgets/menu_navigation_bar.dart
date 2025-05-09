/*
bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              offset: Offset(0, -2), // 👈 위쪽에 드리우는 그림자
              blurRadius: 4,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedBottomIndex,
          selectedItemColor: const Color(0xFF6562DF),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedBottomIndex = index;
              // TODO: 페이지 이동 처리
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedFontSize: 5,
          iconSize: 26,
          items: const [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(height: 10),
                  Icon(Icons.home),
                  SizedBox(height: 40),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(height: 10),
                  Icon(Icons.add_box_outlined),
                  SizedBox(height: 40),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(height: 10),
                  Icon(Icons.receipt_long),
                  SizedBox(height: 40),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(height: 10),
                  Icon(Icons.person),
                  SizedBox(height: 40),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
*/