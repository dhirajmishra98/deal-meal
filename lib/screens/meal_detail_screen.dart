import 'package:flutter/material.dart';
import '/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';

  final Function toggleFavourite;
  final Function isFavourite;
  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMealContent =
        dummyMeals.firstWhere((meal) => meal.id == routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMealContent.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => toggleFavourite(routeArgs),
        child: isFavourite(routeArgs) ? const Icon(Icons.star) :const Icon(Icons.star_border),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              shadowColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.network(
                selectedMealContent.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const BuildSectionTitle(title: 'Ingredients'),
            BuildContainer(
              child: ListView.builder(
                  itemCount: selectedMealContent.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(5),
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${index + 1}. ${selectedMealContent.ingredients[index]}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    );
                  }),
            ),
            const BuildSectionTitle(title: 'Steps'),
            BuildContainer(
                child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(
                      selectedMealContent.steps[index],
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                ],
              ),
              itemCount: selectedMealContent.steps.length,
            ))
          ],
        ),
      ),
    );
    
  }
}

class BuildContainer extends StatelessWidget {
  const BuildContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      height: 200,
      width: 350,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade500,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
