part of '../view/farm_details_view.dart';

class FarmOwnerCardWidget extends StatelessWidget {
  const FarmOwnerCardWidget({super.key, required this.farm});
  final FarmDet farm;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // صورة المالك
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                farm.farmowner?.avatar ?? '',
              ),
              backgroundColor: Colors.grey[200],
            ),

            const SizedBox(width: 16),

            // بيانات المالك
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    farm.farmowner?.name ?? 'Unknown Owner',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Chat with owner',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_in_talk,
                        size: 18,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        farm.farmowner?.phone ?? 'No phone',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // أيقونة الرسائل
            Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.message_outlined,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
