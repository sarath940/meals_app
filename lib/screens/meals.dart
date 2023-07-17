import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals});

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal
            )));
  }


  @override
  Widget build(BuildContext context) {
    Widget contentBody = Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'No Meals are There for ',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        const SizedBox(height: 16),
        Text(
          'Try Selecting different category',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        )
      ],
    ));
    if (meals.isNotEmpty) {
      contentBody = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  selectMeal(context, meals[index]);
                },
              ));
    }

    if (title == null) {
      return contentBody;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: contentBody,
    );
  }
}
