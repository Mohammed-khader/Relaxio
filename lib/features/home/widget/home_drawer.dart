part of '../view/home_view.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 750,
      color: Colors.white,
      child: SafeArea(
        child: ListTileTheme(
          textColor: Colors.black,
          iconColor: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: (UserDataService.userAvater != null &&
                          UserDataService.userAvater!.isNotEmpty)
                      ? Image.network(UserDataService.userAvater!)
                      : const Icon(Icons.person, size: 64, color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: Text(
                  S.of(context).home,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.account_circle_rounded),
                title: Text(
                  S.of(context).profile,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.favorite),
                title: Text(
                  S.of(context).favourites,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingView()),
                  );
                },
                leading: const Icon(Icons.settings),
                title: Text(
                  S.of(context).settings,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () async {
                  UserDataService.dispose();
                  await LocalStorageService.instance.removeAll();
                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                      (route) => false,
                    );
                  }
                },
                leading: const Icon(Icons.logout),
                title: Text(
                  S.of(context).logout,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
