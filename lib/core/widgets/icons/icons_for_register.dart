import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconsForRegister extends StatelessWidget {
  const IconsForRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Or Register with',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.facebook_rounded, size: 50),
            SizedBox(width: 40),
            FaIcon(FontAwesomeIcons.google, size: 40),
            SizedBox(width: 40),
            Icon(Icons.apple_sharp, size: 50),
          ],
        )
      ],
    );
  }
}
