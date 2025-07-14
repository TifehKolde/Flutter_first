import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //runApp
  runApp(const TifehEntryApp());
}

//entryWidget
class TifehEntryApp extends StatelessWidget {
  const TifehEntryApp({super.key});

  @override
  Widget build(BuildContext context) {
    //returnMaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the "DEBUG" banner
      title: "Tifeh App",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 12, 0, 116),
        ),
      ),
      home: TifehHomePage(),
    );
  }
}

//TifehHomePage
class TifehHomePage extends StatefulWidget {
  const TifehHomePage({super.key});

  @override
  State<TifehHomePage> createState() => _TifehHomePageState();
}

class _TifehHomePageState extends State<TifehHomePage> {
  //scaffoldkey
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 0, 255),
        iconTheme: IconThemeData(
          color: Colors.white, // 🎨 change this to your desired color
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 20,
        title: Text("TifehApp", style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Boluwatife Elijah"),
              accountEmail: Text("tifeh@bricamax.com.ng"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                backgroundImage: NetworkImage(
                  "https://bricamax.com.ng/wp-content/uploads/2025/07/boluwatife.jpeg",
                ),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 111, 1),
              ),
            ),
            ListTile(title: Text("Home")),
            Divider(color: Colors.black),
            ListTile(
              title: Text("About"),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.info),
            ),
            Divider(color: Colors.black),
            ListTile(title: Text("Contact"), leading: Icon(Icons.phone)),
            Divider(color: Colors.black),
            ListTile(title: Text("Settings"), leading: Icon(Icons.settings)),
            Divider(color: Colors.black),
            ListTile(title: Text("Logout"), leading: Icon(Icons.logout)),
            Divider(color: Colors.black),
            ListTile(
              title: Text(
                "App Version 1.0.0",
                style: TextStyle(
                  fontStyle: FontStyle.italic, // this make it italic
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: const Color.fromARGB(255, 82, 82, 82),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.share),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Column(
            children: [
              Text(
                "Yo Watsup",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              //image from network
              Image.network(
                "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
                width: 500.0,
                height: 500.0,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.center,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter something",
                  hintText: "Net somthing",
                ),
              ),
              //add elevated button
              ElevatedButton(
                onPressed: () {
                  print("CLicked");

                  //showsnackbar
                  ScaffoldMessenger.of(
                    _scaffoldKey.currentContext!,
                  ).showSnackBar(
                    SnackBar(
                      content: Text("This is the new way!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                child: Text("Click me"),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.info)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
            IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
            IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
          ],
        ),
      ],
    );
  }
}
