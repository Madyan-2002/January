import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:january_project/Data/db.dart';
import 'package:january_project/styles/color_class.dart';
import 'package:january_project/widget/custom_container.dart';
import 'package:january_project/widget/custom_text_field.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = 'All';
  bool changeColor = true;
   var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.backG,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        keyType: TextInputType.text,
                        labl: 'Search',
                        hint: "Find your Perfume",
                        preIcon: Icons.search,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_sharp,
                        color: ColorClass.icons,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 300),
                  ),
                  items: perfumes.take(15).map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                Color(0xCDD9A071).withOpacity(0.2),
                                BlendMode.darken,
                              ),
                              image: AssetImage(item['image']!),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Mad',
                              style: TextStyle(
                                color: ColorClass.mad,
                                fontFamily: 'Averia',
                                fontSize: 20,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: CustomContainer(
                          text: categories[index],
                          isSelected: selectedFilter == categories[index],
                          onTap: () {
                            setState(() {
                              selectedFilter = categories[index];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),

                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: perfumes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      // التأكد من جلب البيانات بشكل صحيح لمنع الـ null
                      final String imagePath = perfumes[index]['image'] ?? '';
                      final String perfumeName = perfumes[index]['name'] ?? '';

                      return customPhoto(imagePath, perfumeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
       bottomNavigationBar: SalomonBottomBar(
        backgroundColor: ColorClass.backG,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
    );
  }

  Widget customPhoto(String imgs, String name) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD9A071).withOpacity(0.15),
                      blurRadius: 20,
                      spreadRadius: 3,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(imgs, fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 0.2,
                right: 0.2,
                child: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      changeColor = !changeColor;
                    });
                  },
                  icon: changeColor
                      ? Icon(Icons.favorite_rounded, color: Colors.grey)
                      : Icon(Icons.favorite_rounded, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Averia',
            color: Color(0xFF4A4A4A),
          ),
        ),
      ],
    );
  }
}
