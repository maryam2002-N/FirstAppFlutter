import 'package:first_app/ChatBotPage.dart';
import 'package:first_app/MeteoPage.dart';
import 'package:first_app/contacts_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My App",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Center(
        child: Text("Le contenu de la page "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Nfad Maryam"),
              accountEmail: Text("maryamNfad@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/photo.png"),
              ),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                // Logique à exécuter lorsque l'utilisateur clique sur cet élément
              },
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text(
                "Contacts",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactsPage()));
                // Logique à exécuter lorsque l'utilisateur clique sur cet élément
              },
              leading: Icon(Icons.contacts),
            ),
            ListTile(
              title: Text(
                "Météo",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MeteoPage()));
                // Logique à exécuter lorsque l'utilisateur clique sur cet élément
              },
              leading: Icon(Icons.ac_unit_rounded),
            ),
            ListTile(
              title: Text(
                "ChatBot",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatBotPage()));
                // Logique à exécuter lorsque l'utilisateur clique sur cet élément
              },
              leading: Icon(Icons.mark_unread_chat_alt_outlined),
            ),
            ListTile(
              title: Text(
                "Mask Detection",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                // Logique à exécuter lorsque l'utilisateur clique sur cet élément
              },
              leading: Icon(Icons.photo_camera),
            ),
          ],
        ),
      ),
    );
  }
}
