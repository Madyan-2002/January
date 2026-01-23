import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:january_project/Data/db.dart';
import 'package:january_project/styles/color_class.dart';
import 'package:january_project/widget/custom_container.dart';
import 'package:january_project/widget/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Icons.notifications_none,
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
                  items: imgs.map((i) {
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
                              image: AssetImage(i),
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
                const SizedBox(height: 35),

                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: imgs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customPhoto(imgs[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customPhoto(String imgs) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: DecorationImage(
              image: NetworkImage(imgs),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
