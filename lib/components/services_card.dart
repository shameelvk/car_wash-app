import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ServiceCard extends StatefulWidget {
  ServiceCard({super.key});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  final List _selectedIndexs = [];
  Color borderColor = Colors.black;
  bool selected = false;
  List<Map<String, dynamic>> washcard = [
    {"icon": Icons.car_rental, "text": "Classic\nWashing"},
    {"icon": Icons.card_giftcard, "text": "form\nWashing"},
    {"icon": Icons.card_membership, "text": "External\nWashing"},
    {"icon": Icons.card_travel, "text": "Classic\nWashing"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: washcard.length,
          itemBuilder: ((context, index) {
            final _isSelected = _selectedIndexs.contains(index);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (_isSelected) {
                    _selectedIndexs.remove(index);
                  } else {
                    _selectedIndexs.add(index);
                  }
                });
              },
              child: Card(
                shape: _isSelected
                    ? RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.circular(15))
                    : RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(15)),
                color: Colors.white,
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        washcard[index]["icon"],
                        size: 50,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        washcard[index]["text"],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
