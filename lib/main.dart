import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Listesi Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List alisverisListesi = [];
  TextEditingController td = TextEditingController();

  elemanEkle() {
    setState(() {
      alisverisListesi.add(td.text);
      td.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(td.text);
      td.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            itemCount: alisverisListesi.length,
            itemBuilder: (context, indeksNumarasi) => ListTile(
              subtitle: Text("Alışveriş Malzemeleri"),
              title: Text(alisverisListesi[indeksNumarasi]),
            ),
          )),
          TextField(
            controller: td,
          ),
          ElevatedButton(
              onPressed: () {
                elemanEkle();
              },
              child: Text("Ekle")),
          ElevatedButton(
              onPressed: () {
                elemanCikar();
              },
              child: Text("Çıkar"))
        ],
      ),
    );
  }
}
