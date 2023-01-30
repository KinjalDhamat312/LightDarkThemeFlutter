import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:light_dark_mode/provider%20/app_theme_provider.dart';
import 'package:light_dark_mode/utils/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Light/Dark Theme',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context, ref.watch(appThemeProvider)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_sharp),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(1), // Border radius
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "assets/ic_profile.jpeg",
                      fit: BoxFit.fill,
                      width: 120,
                      height: 120,
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 60),
              alignment: Alignment.center,
              child: Text(
                "Testing User",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListTile(
              leading: Icon(isDarkMode ? Icons.brightness_3 : Icons.sunny),
              title: Text(
                isDarkMode ? "Dark mode" : "Light mode",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Consumer(builder: (context, ref, child) {
                return Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    activeColor: Colors.orange,
                    onChanged: (value) {
                      ref.read(appThemeProvider.notifier).state = value;
                    },
                    value: isDarkMode,
                  ),
                );
              }),
            ),
            ListTile(
              leading: Icon(
                Icons.grid_on_sharp,
                color: colors(context).color1,
              ),
              title: Text(
                "Story",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: colors(context).color2),
              title: Text("Settings and Privacy",
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            ListTile(
              leading: Icon(Icons.chat_outlined, color: colors(context).color3),
              title: Text(
                "Help Center",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(
                "Notification",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
