import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Light/Dark Theme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
          titleSmall: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: 11),
        )
            .apply(
          bodyColor: Colors.black,
          displayColor: Colors.grey,
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black54, size: 25)),
      ),
      home: const MyHomePage(),
    );
  }
}

// Color(0xFFA394C2)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(
                "Testing User",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              alignment: Alignment.center,
              child: Text(
                "testing@example.com",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text(
                "Light/Dark Theme",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.grid_on_sharp),
              title: Text(
                "Story",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text(
                "Group",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text(
                "Media and Photo",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings and Privacy",
                style: Theme.of(context).textTheme.titleSmall ?? TextStyle(),
              ),
            ),
            ListTile(
              leading: Icon(Icons.chat_outlined),
              title: Text(
                "Help Center",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
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
