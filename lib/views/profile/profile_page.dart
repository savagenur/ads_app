import 'package:ads_app/app/dimension/design_dimension.dart';
import 'package:ads_app/core/extensions/to_build_context_extension.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey,
              ),
            ),
            DDimens.mediumPadding.verticalBox,
            Text(
              "Ислам Иманходжаев",
              style: context.textTheme.titleLarge,
            ),
            DDimens.smallPadding.verticalBox,
            Text(
              "1000 сом",
              style: context.textTheme.headlineMedium!.copyWith(
                color: Colors.grey,
              ),
            ),
            Divider(),
            buildItem(
              iconData: Icons.person_outline,
              title: "Аккаунт",
            ),
            buildItem(
              iconData: Icons.settings_outlined,
              title: "Настройки",
            ),
            buildItem(
              iconData: Icons.notifications_outlined,
              title: "Уведомления",
            ),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red[700],
              ),
              onTap: () {},
              title: Text(
                "Выйти из аккаунта",
                style: TextStyle(color: Colors.red[700]),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile buildItem(
      {required IconData iconData,
      required String title,
      VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(
        iconData,
      ),
      onTap: onTap ?? () {},
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
      ),
    );
  }
}
