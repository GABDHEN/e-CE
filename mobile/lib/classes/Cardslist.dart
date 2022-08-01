// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile/screens/Avis_contr%C3%B4le.dart';

class Cardslist extends StatefulWidget {
  final String titre;
  final String soustitre;
  final IconData? icon;
  final String date;

  Cardslist({
    Key? key,
    this.icon,
    required this.titre,
    required this.soustitre,
    required this.date,
  }) : super(key: key);

  @override
  State<Cardslist> createState() => _CardslistState();
}

class _CardslistState extends State<Cardslist> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: IconButton(
              onPressed: () => {},
              icon: Icon(widget.icon ?? Icons.remove_red_eye_sharp),
            ),
            title: Text(widget.titre +
                "                                       " +
                widget.date.substring(0, 10)),
            subtitle: Text(widget.soustitre),
            //trailing: Text(widget.date.substring(0, 10)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.edit_note_outlined),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Avis_controle(),
                    ),
                  );
                },
              ),
              //const Text("Rédiger un avis")
            ],
          ),
        ],
      ),
    );
  }
}
