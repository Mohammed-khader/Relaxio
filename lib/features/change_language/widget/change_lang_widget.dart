part of '../view/change_language_view.dart';

class ChangeLangWidget extends StatelessWidget {
  const ChangeLangWidget({super.key, required this.cubit});
  final ChangeLangCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Text(
          S.of(context).chooseTheApplicationLanguageThatSuitsYou,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 50),
        ListTile(
          onTap: () => cubit.changeLanguage('ar'),
          title: Text(
            '🇸🇦  العربية',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () => cubit.changeLanguage('en'),
          title: Text(
            '🇺🇸  English',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
