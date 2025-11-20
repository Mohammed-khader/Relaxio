part of '../view/home_view.dart';

class FarmCardWidget extends StatelessWidget {
  const FarmCardWidget({super.key, required this.farm});
  final Farm farm;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FarmDetailsView(farmId: farm.id ?? 0),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المزرعة
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1,
                      autoPlay: false,
                    ),
                    items: farm.images?.map((img) {
                          return Image.network(
                            img.imagePath ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        }).toList() ??
                        [],
                  ),
                ),
                // شارة الخصم
                if ((farm.currentOfferPercentage ?? 0) > 0)
                  Positioned(
                    top: 20,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Good Deal ${farm.currentOfferPercentage ?? ''}%",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                // أيقونة المفضلة
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: Icon(
                      (farm.isFavorite ?? false)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            // بيانات المزرعة
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ChangeLangCubit, ChangeLangStates>(
                builder: (context, state) {
                  final langCode = context
                      .read<ChangeLangCubit>()
                      .currentLocale
                      .languageCode;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        langCode == 'ar'
                            ? farm.nameAr ?? ''
                            : farm.nameEn ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        langCode == 'ar'
                            ? farm.descriptionAr ?? ''
                            : farm.descriptionEn ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            "${farm.minimumPriceAfterOffer ?? farm.minimumPrice} JD",
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 15),
                          if ((farm.currentOfferPercentage ?? 0) > 0)
                            Text(
                              "Good Deal ${farm.currentOfferPercentage ?? ''}%",
                              style: const TextStyle(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 205, 210),
                                  color: Color.fromARGB(255, 253, 21, 5),
                                  fontWeight: FontWeight.bold),
                            ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 22),
                              const SizedBox(width: 2),
                              Text("${farm.averageRating ?? 0}",
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
