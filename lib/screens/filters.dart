import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/fliters_provider.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProviders);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        // drawer: MainDrawer(onSelectScreen: (ideneifier) {
        //   Navigator.of(context).pop();
        //   if (ideneifier == 'Meals') {
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (ctx) => const TabScreen()));
        //   }
        // }),
        body: Column(children: [
          SwitchListTile(
            value: activeFilters[Filters.glutenfree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilter(Filters.glutenfree, isChecked);
            },
            title: Text(
              'Gluten free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only includes Gluten free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactosefree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilter(Filters.lactosefree, isChecked);
            },
            title: Text(
              'Lactose free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only includes Lactose free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegetrain]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilter(Filters.vegetrain, isChecked);
            },
            title: Text(
              'Vegetarin',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only includes Vegetrain meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilter(Filters.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only includes vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ]));
  }
}
