import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relaxio/features/change_language/view/change_language_view.dart';
import 'package:relaxio/generated/l10n.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(S.of(context).settings,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.person,
              size: 30,
            ),
            title: Text(S.of(context).editProfile,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangeLanguageView(),
                ),
              );
            },
            leading: const Icon(
              Icons.language,
              size: 30,
            ),
            title: Text(S.of(context).changeLanguage,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
