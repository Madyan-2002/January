import 'package:flutter/material.dart';
import 'package:january_project/Model/favorite_provider.dart';
import 'package:january_project/Model/perfume_model.dart';
import 'package:january_project/styles/color_class.dart';
import 'package:provider/provider.dart';

class ItemsCard extends StatelessWidget {
  final PerfumeModel perfume;
  const ItemsCard({super.key, required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Container(
      // الحاوية الخارجية للكارت
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. منطقة الصورة
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: ColorClass.lightGrey, 
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(perfume.image, fit: BoxFit.contain),
                  ),
                ),
              ),

              // 2. النصوص (الاسم والسعر)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      perfume.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorClass.darkGrey,
                        fontFamily: 'Averia', // حافظت على الخط الخاص بك
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${perfume.price} \$",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: ColorClass.price,
                        fontFamily: 'Averia',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),

          // 3. زر القلب (تصميم عصري منفصل)
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                context.read<FavoriteProvider>().toggleFavorite(perfume);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  context.watch<FavoriteProvider>().isFavorite(perfume)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.redAccent,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
