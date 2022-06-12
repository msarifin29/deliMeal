import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity})
      : super(key: key);
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: 220,
                      decoration: BoxDecoration(color: Colors.black12),
                      child: Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ]),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [Icon(Icons.schedule), Text(duration.toString())],
                ),
              )
            ],
          )),
    );
  }
}
