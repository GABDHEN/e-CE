import 'package:flutter/material.dart';
import 'package:mobile/constants/colors.dart';

class ProfilContainerItem extends StatefulWidget {
  const ProfilContainerItem({Key? key}) : super(key: key);

  @override
  State<ProfilContainerItem> createState() => _ProfilContainerItemState();
}

class _ProfilContainerItemState extends State<ProfilContainerItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      child: Column(
        children: [
          // Text()
        ],
      ),
    );
  }
}
