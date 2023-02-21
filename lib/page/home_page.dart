import 'package:flutter/material.dart';
import 'package:project_ss59/page/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text("Zero Blash"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile
          sectionProfile(),
          const Divider(
            height: 5,
            thickness: 2,
          ),
          // Title Menu
          titleMenu(),
          const SizedBox(height: 12.0),
          // List Activity
          Expanded(child: sectionList()),
          // const SizedBox(height: 30.0),
        ],
      ),
      bottomNavigationBar: sectionBottomNav(),
    );
  }

  Padding sectionProfile() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryColor, width: 2)),
            child: Icon(
              Icons.flutter_dash,
              size: 70,
              color: primaryColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Zero",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6.0),
              Text(
                "PT. DKM",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6.0),
              Text(
                "Mobile Developer",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget titleMenu() {
    return const Padding(
      padding: EdgeInsets.only(left: 16, top: 16),
      child: Text(
        "Aktivitas",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget sectionList() {
    return GridView.builder(
      itemCount: menuList.length,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        var item = menuList[index];
        return itemGrid(
          item,
          onTap: () {
            debugPrint(item['title'] ?? item['product_name']);
          },
        );
      },
    );
  }

  Widget itemGrid(item, {Function()? onTap}) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (item['icon'] != null)
              Icon(
                item['icon'],
                size: 50,
                color: primaryColor,
              ),
            if (item['photo'] != null)
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(item['photo']),
                      fit: BoxFit.cover,
                    )),
              ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              item['product_name'] ?? item['title'],
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  BottomNavigationBar sectionBottomNav() {
    return BottomNavigationBar(
      selectedItemColor: primaryColor,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
