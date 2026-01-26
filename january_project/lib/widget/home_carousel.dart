import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Model/perfume_model.dart';
import '../styles/color_class.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
