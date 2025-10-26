part of '../view/home_view.dart';

class _EmptyFarmsWidget extends StatelessWidget {
  const _EmptyFarmsWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary,
          ),
        ),
        child: const Center(
          child: Text(
            'No Farm Available',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
