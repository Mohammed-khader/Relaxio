part of '../view/farm_details_view.dart';

class FarmDescription extends StatelessWidget {
  const FarmDescription({super.key, required this.farm});
  final FarmDet farm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLangCubit, ChangeLangStates>(
      builder: (context, state) {
        final langCode =
            context.read<ChangeLangCubit>().currentLocale.languageCode;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${S.of(context).maxGuestes} : ${farm.guestsCount}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).description,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              langCode == 'ar' ? farm.descriptionAr : farm.descriptionEn,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: farm.images!
                        .map(
                          (img) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              img.imagePath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
