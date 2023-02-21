import 'package:flutter/material.dart';

// URl
String baseUrl = "http://192.168.137.124/api_ss59";

ThemeData theme = ThemeData(
  primaryColor: const Color(0xFF6F35A5),
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xFF6F35A5),
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF1E6FF),
    iconColor: Color(0xFF6F35A5),
    prefixIconColor: Color(0xFF6F35A5),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
);

// Text style & color
TextStyle textStyle = const TextStyle();

Color primaryColor = const Color(0xFF6F35A5);

Future dialogInformation(BuildContext context,
    {String? title,
    String? contentText,
    Widget? content,
    Function()? onConfirm}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title ?? "Peringatan"),
      content: content ?? Text(contentText ?? ""),
      actions: [
        TextButton(
          onPressed: onConfirm ??
              () {
                Navigator.pop(context);
              },
          child: const Text("Oke"),
        ),
      ],
    ),
  );
}

final List menuList = [
  {
    "id": 1,
    "title": "Absesi",
    "icon": Icons.fingerprint,
  },
  {
    "id": 2,
    "title": "Riwayat",
    "icon": Icons.history,
  },
  {
    "id": 3,
    "title": "Kehadiran",
    "icon": Icons.people,
  },
];
// data dummy product list
final List products = [
  {
    "id": 1,
    "photo":
        "https://www.wikihow.com/images/thumb/a/a9/Freeze-Pizza-Step-1.jpg/v4-460px-Freeze-Pizza-Step-1.jpg.webp",
    "product_name": "Frenzy Pizza",
    "price": 25,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 2,
    "photo":
        "https://asset.kompas.com/crops/JFC1_i_OaGvcNEviEw4WKk-r3qQ=/12x51:892x637/750x500/data/photo/2022/03/05/622358ed771fb.jpg",
    "product_name": "Beef Burger",
    "price": 22,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 3,
    "photo":
        "https://images.unsplash.com/photo-1625869016774-3a92be2ae2cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Seperait",
    "price": 33,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 4,
    "photo":
        "https://images.unsplash.com/photo-1578160112054-954a67602b88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
    "product_name": "Fried Rice",
    "price": 31,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 5,
    "photo":
        "https://cdn0-production-images-kly.akamaized.net/iTTdy35TNVp9SnugEHlT_WYzEIc=/0x220:5587x3369/469x260/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3598415/original/074208000_1633924030-shutterstock_1114766150.jpg",
    "product_name": "Terrano Milk",
    "price": 32,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 6,
    "photo":
        "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "product_name": "Fried Chicken",
    "price": 49,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 7,
    "photo":
        "https://images.unsplash.com/photo-1525385133512-2f3bdd039054?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
    "product_name": "Mango Juice",
    "price": 62,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 8,
    "photo":
        "https://images.unsplash.com/photo-1600271886742-f049cd451bba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Orange Juice",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 9,
    "photo":
        "https://images.unsplash.com/photo-1604085792782-8d92f276d7d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
    "product_name": "Avocado Juice",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 10,
    "photo":
        "https://images.unsplash.com/photo-1622240506921-042a4e71c172?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Puncak Coffe",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 11,
    "photo":
        "https://images.unsplash.com/photo-1594631252845-29fc4cc8cde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Silvana Tea",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 12,
    "photo":
        "https://images.unsplash.com/photo-1576092768241-dec231879fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Paradox Tea",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
];
