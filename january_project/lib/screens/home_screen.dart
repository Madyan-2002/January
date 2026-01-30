import 'package:flutter/material.dart';
import 'package:january_project/Model/perfume_model.dart';
import 'package:january_project/screens/details_screen.dart';
import 'package:january_project/styles/color_class.dart';
import 'package:january_project/widget/custom_container.dart';
import 'package:january_project/widget/custom_text_field.dart';
import 'package:january_project/widget/home_carousel.dart';
import 'package:january_project/widget/items_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = 'All';

  List<PerfumeModel> favoritePerfumes = [];

  // دالة لإضافة أو حذف العنصر
  void toggleFavorite(PerfumeModel perfume) {
    setState(() {
      if (favoritePerfumes.contains(perfume)) {
        favoritePerfumes.remove(perfume);
      } else {
        favoritePerfumes.add(perfume);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.backG,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /// ===== TOP CONTENT =====
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    /// Search + Notification
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            keyType: TextInputType.text,
                            labl: 'Search',
                            hint: "Find your Perfume",
                            preIcon: Icon(
                              Icons.search,
                              color: ColorClass.icons,
                            ),
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

                    const SizedBox(height: 10),

                    /// Carousel
                    const HomeCarousel(),

                    const SizedBox(height: 10),

                    /// Categories
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
                  ],
                ),
              ),
            ),

            /// ===== GRID PRODUCTS =====
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(mad: perfumesList[index]),
                        ),
                      );
                    },
                    child: ItemsCard(perfume: perfumesList[index]),
                  );
                }, childCount: perfumesList.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
