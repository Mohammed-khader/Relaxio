part of '../view/farm_details_view.dart';

class FarmNameAndCityWigdet extends StatelessWidget {
  const FarmNameAndCityWigdet({super.key, required this.farm});
  final FarmDet farm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(farm.nameEn, style: const TextStyle(fontSize: 20))
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.location_on_sharp, color: AppColors.primary),
            Text(
              ' ${farm.city?.nameEn ?? ''}  -  ',
              style: const TextStyle(color: AppColors.primary),
            ),
            Text(
              farm.area?.nameEn ?? '',
              style: const TextStyle(color: AppColors.primary),
            ),
            const Spacer(),
            const Icon(Icons.star, color: Colors.amber),
            Text(farm.averageRating.toString()),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
