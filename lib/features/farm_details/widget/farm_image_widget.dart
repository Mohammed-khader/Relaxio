part of '../view/farm_details_view.dart';

class FarmImageWidget extends StatelessWidget {
  const FarmImageWidget({super.key, required this.farm, required this.images});
  final FarmDet farm;
  final List<ImageModel> images;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              autoPlay: true,
            ),
            items: images.isNotEmpty
                ? images.map((img) {
                    return Image.network(
                      img.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  }).toList()
                : [
                    Container(
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
          ),
        ),

        // شارة الخروج
        Positioned(
          top: 50,
          left: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.9),
            child: const CloseButton(),
          ),
        ),

        // أيقونة المفضلة
        Positioned(
          top: 50,
          right: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.9),
            child: Icon(
              farm.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
