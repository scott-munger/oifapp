import 'package:flutter/material.dart';
import '../data/database_helper.dart';

class RedacteursPage extends StatefulWidget {
  const RedacteursPage({super.key});

  @override
  State<RedacteursPage> createState() => _RedacteursPageState();
}

class _RedacteursPageState extends State<RedacteursPage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<Map<String, dynamic>> _redacteurs = [];

  @override
  void initState() {
    super.initState();
    _refreshRedacteurs();
  }

  void _refreshRedacteurs() async {
    final data = await DatabaseHelper.instance.fetchUsers();
    setState(() => _redacteurs = data);
  }

  void _ajouterRedacteur() async {
    if (_nomController.text.isEmpty ||
        _prenomController.text.isEmpty ||
        _emailController.text.isEmpty)
      return;

    await DatabaseHelper.instance.insertUser({
      'nom': _nomController.text,
      'prenom': _prenomController.text,
      'email': _emailController.text,
    });

    _nomController.clear();
    _prenomController.clear();
    _emailController.clear();
    _refreshRedacteurs();
  }

  void _modifierRedacteur(Map<String, dynamic> redacteur) {
    _nomController.text = redacteur['nom'];
    _prenomController.text = redacteur['prenom'];
    _emailController.text = redacteur['email'];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Modifier rédacteur"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: "Nom"),
            ),
            TextField(
              controller: _prenomController,
              decoration: const InputDecoration(labelText: "Prénom"),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            onPressed: () async {
              await DatabaseHelper.instance.updateUser({
                'id': redacteur['id'],
                'nom': _nomController.text,
                'prenom': _prenomController.text,
                'email': _emailController.text,
              });
              _refreshRedacteurs();
              Navigator.pop(context);
            },
            child: const Text("Sauvegarder"),
          ),
        ],
      ),
    );
  }

  void _supprimerRedacteur(int id) async {
    await DatabaseHelper.instance.deleteUser(id);
    _refreshRedacteurs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestion des rédacteurs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: "Nom"),
            ),
            TextField(
              controller: _prenomController,
              decoration: const InputDecoration(labelText: "Prénom"),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _ajouterRedacteur,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),

              child: const Text("Ajouter Redacteur"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: _redacteurs.length,
                itemBuilder: (context, index) {
                  final r = _redacteurs[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text("${r['nom']} ${r['prenom']}"),
                      subtitle: Text(r['email']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _modifierRedacteur(r),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _supprimerRedacteur(r['id']),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
