// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_app_ui/util/coffee_tiles.dart';
import 'package:coffee_app_ui/util/coffee_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List coffee types
  final List coffeeType = [
    [
      'Capuchino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Espresso',
      false,
    ],
    [
      'Milk',
      false,
    ],
  ];

  //user taps on a coffee type
  void CoffeeTypeSelected(int index) {
    setState(() {
      for(int i = 0; i < coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          //find the best coffee
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),

          SizedBox(height: 25),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your coffee",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
          // horizontal list view of coffee categories
          SizedBox(height: 25),

          //horizontal list view of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  OnTap: (){
                    CoffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          //horizontal list view of coffee tiles
          Expanded(
            //Giải thích về Expanded:
            // Nếu bạn có một Column với hai widget,
            //một widget chiếm 100 pixels chiều cao
            //và một widget sử dụng Expanded, thì
            //widget Expanded sẽ chiếm phần còn lại
            //của chiều cao màn hình sau khi trừ đi 100 pixels.
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImage: 'lib/images/capuchino.jpg',
                  coffeeName: 'Capuchino',
                  coffeeDescription: 'Test',
                  coffeePrice: '5.15',
                ),
                CoffeeTile(
                  coffeeImage: 'lib/images/coffee.jpg',
                  coffeeName: 'Coffee',
                  coffeeDescription: 'Test',
                  coffeePrice: '5.99',
                ),
                CoffeeTile(
                  coffeeImage: 'lib/images/latte.jpg',
                  coffeeName: 'Lattee',
                  coffeeDescription: 'Test',
                  coffeePrice: '4.99',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
