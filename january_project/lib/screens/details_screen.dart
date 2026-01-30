import 'package:flutter/material.dart';
import 'package:january_project/Model/perfume_model.dart';
import 'package:january_project/styles/color_class.dart';

class DetailsScreen extends StatelessWidget {
  final PerfumeModel mad;
  const DetailsScreen({super.key, required this.mad});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorClass.details,
      appBar: AppBar(
        title: Text(
          mad.name,
          style: TextStyle(
            fontFamily: 'Averia',
            fontWeight: .bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.favorite_border, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Container(
              height: height * 0.50,
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
                  image: AssetImage(mad.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Text(
              mad.description,
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontWeight: .bold),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Card(
                  elevation: 25,
                  color: ColorClass.details,
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Center(
                      child: Text(
                        '${mad.price} \$',
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(fontWeight: .bold, color: ColorClass.mad),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 25,
                  color: ColorClass.mad,
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Text(
                        "ADD TO CART",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: .bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
