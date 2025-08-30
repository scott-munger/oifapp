import 'package:flutter/material.dart';
import 'pages/page_principale.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Magazine",
      home: PagePrincipale(),
    );
  }
}
