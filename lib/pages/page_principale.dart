
import 'package:flutter/material.dart';
import 'redacteurs_page.dart';

class PagePrincipale extends StatelessWidget {
  const PagePrincipale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 243, 33, 93),
        title: const Text(
          "Magazine Infos",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Accueil"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const PagePrincipale()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Rédacteurs"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RedacteursPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: const [
            Image(image: AssetImage("assets/images/Moscow.jpg")),
            PartieTitre(),
            PartieText(),
            PartieIcone(),
            PartieRubrique(),
          ],
        ),
      ),
    );
  }
}

// mêmes widgets PartieTitre, PartieText, PartieIcone, PartieRubrique que tu as déjà
class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bienvenue au Magazine Infos ",
            style: TextStyle(
              color: const Color.fromARGB(221, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Votre magazine numerique, votre source d'inspiration"),
        ],
      ),
    );
  }
}

class PartieText extends StatelessWidget {
  const PartieText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "Magazine Infos est bien plus qu'un simple magazine d'informations. C'est votre passerelle vers le monde, une source inestimable de connaissances et d'actualités soigneusement sélectionnées pour vous éclairer sur les enjeux mondiaux, la culture, la science et voir même le divertissement (le jeux).",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [Icon(Icons.phone), SizedBox(height: 10), Text("TEL")],
            ),
          ),
          Expanded(
            child: Column(
              children: [Icon(Icons.mail), SizedBox(height: 10), Text("MAIL")],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Icon(Icons.share),
                SizedBox(height: 10),
                Text("PARTEGE"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: const Image(
                image: AssetImage("assets/images/magazine.jpg"),
                width: 150,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: const Image(
                image: AssetImage("assets/images/maga.jpg"),
                width: 150,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
