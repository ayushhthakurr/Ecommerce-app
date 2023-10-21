import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:gap/gap.dart';
import '../utils/category_button.dart';
import '../product_cards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  List<String> images = [
    'assets/images/iphone.jpg',
    'assets/images/redmi.jpg',
    'assets/images/oneplus.jpg',
  ];

  String selected = "All Product";

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          leading: SizedBox(),
          toolbarHeight: 2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                AssetImage('assets/images/profile_picture.jpg'),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                'Ayush',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.notifications),
                            onPressed: () {
                              // Handle notification button press
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              // Open sliding menu
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for brand',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20.0),
              // Sliding Images Section
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        );
                      },
                      onPageChanged: (int index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    Positioned(
                      left: 16, // Adjust the left offset as needed
                      bottom: 16, // Adjust the bottom offset as needed
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                        onPressed: () {},
                        child: Text('Shop Now', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      child: DotsIndicator(
                        dotsCount: images.length,
                        position: _currentIndex,
                        decorator: const DotsDecorator(
                          activeColor: Colors.black54,
                          size: Size(10.0, 10.0),
                          activeSize: Size(12.0, 12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              // Product Category Selector
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CategoryButton(
                      text: 'All Product',
                      onPressed: () {
                        setState(() {
                          selected = "All Product";
                        });
                      },
                      selected: selected,
                    ),
                    CategoryButton(
                      text: 'Smartphones',
                      onPressed: () {
                        setState(() {
                          selected = "Smartphones";
                        });
                      },
                      selected: selected,
                    ),
                    CategoryButton(
                      text: 'Wearables',
                      onPressed: () {
                        setState(() {
                          selected = "Wearables";
                        });
                      },
                      selected: selected,
                    ),
                    CategoryButton(
                      text: 'Camera',
                      onPressed: () {
                        setState(() {
                          selected = "Camera";
                        });
                      },
                      selected: selected,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrivals",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              const Gap(12),
              ProductCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
