import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persist_theme/persist_theme.dart';

import '../../utils/index.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.bug_report),
              title: Text('Bug Report'),
              subtitle: Text('File a new Issue'),
              onTap: () => launchUrl(
                  'https://github.com/Mosquito1123/SmartPiano/issues/new'),
            ),
            // ListTile(
            //   leading: Icon(Icons.palette),
            //   title: Text('Theme Settings'),
            //   subtitle: Text('Dark Mode and Custom Themes'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => SettingsSubView(
            //               title: 'Theme Settings',
            //               children: <Widget>[
            //                 DarkModeSwitch(
            //                   leading: Icon(FontAwesomeIcons.moon),
            //                 ),
            //                 TrueBlackSwitch(
            //                   leading: Icon(FontAwesomeIcons.solidMehBlank),
            //                 ),
            //                 CustomThemeSwitch(
            //                   leading: Icon(Icons.palette),
            //                 ),
            //                 PrimaryColorPicker(
            //                   type: _pickerType(),
            //                   leading: Icon(FontAwesomeIcons.star),
            //                 ),
            //                 AccentColorPicker(
            //                   type: _pickerType(),
            //                   leading: Icon(Icons.add_circle_outline),
            //                 ),
            //                 DarkAccentColorPicker(
            //                   type: _pickerType(),
            //                   leading: Icon(Icons.add_circle_outline),
            //                 ),
            //               ],
            //             )));
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('AboutMe'),
              subtitle: Text('App Info and Credits'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingsSubView(
                          title: 'AboutMe',
                          children: <Widget>[
//                            ListTile(
//                              leading: Icon(Icons.web),
//                              title: Text('Website'),
//                              subtitle: Text('Mosquito1123'),
//                              onTap: () => launchUrl('https://github.com/Mosquito1123'),
//                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.twitter),
                              title: Text('Twitter'),
                              subtitle: Text('@Winston_Cheung_'),
                              onTap: () => launchUrl(
                                  'https://twitter.com/Winston_Cheung_'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.github),
                              title: Text('GitHub'),
                              subtitle: Text('@Mosquito1123'),
                              onTap: () =>
                                  launchUrl('https://github.com/Mosquito1123'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.youtube),
                              title: Text('YouTube'),
                              subtitle: Text('@Winston'),
                              onTap: () => launchUrl(
                                  'https://www.youtube.com/channel/UCNXevy1BalIc7gYwLPFxL2g?view_as=subscriber'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.qq),
                              title: Text('QQ'),
                              subtitle: Text('@1020222363'),
                              onTap: () => launchUrl('1020222363'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.facebook),
                              title: Text('Facebook'),
                              subtitle: Text('@winston.zhang.9889'),
                              onTap: () => launchUrl(
                                  'https://www.facebook.com/winston.zhang.9889'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.telegram),
                              title: Text('Telegram'),
                              subtitle: Text('@Winston'),
                              onTap: () => launchUrl('https://t.me/WinstonKim'),
                            ),
                          ],
                        )));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.bug_report),
            //   title: Text('Beta'),
            //   subtitle: Text('Join the Beta'),
            //   onTap: () => launchUrl('https://testflight.com/'),
            // ),
          ],
        ),
      ),
    );
  }

  PickerType _pickerType() {
    return isMobileOS ? PickerType.material : PickerType.block;
  }
}

class SettingsSubView extends StatelessWidget {
  SettingsSubView({
    @required this.children,
    this.title = 'Settings',
  });
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
