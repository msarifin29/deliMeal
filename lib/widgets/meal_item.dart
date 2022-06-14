import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String? get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        'Hard';
        break;
      default:
        return ' Unknown';
    }
    return null;
  }

  String? get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';

      default:
        return ' Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, '/meal-detail', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      width: 230,
                      decoration: const BoxDecoration(color: Colors.black12),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ]),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5),
                      Text(
                        duration.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ]),
                    Row(children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 5),
                      Text(
                        complexityText.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ]),
                    Row(children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 5),
                      Text(
                        affordabilityText.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ]),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
