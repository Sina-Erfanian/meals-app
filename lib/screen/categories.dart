import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/category_item_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeal});
  final List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealsScreen(
        title: category.title,
        meals: filteredMeals,
      );
    }));
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0.3, 0.3),
    end: const Offset(0.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onPressNavigator: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
