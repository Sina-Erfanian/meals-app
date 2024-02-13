import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

// ignore: must_be_immutable
class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      body: Column(children: [
        SwitchListTile(
          value: activeFilters[Filters.glutenFree]!,
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filters.glutenFree, isChecked);
          },
          title: Text(
            "Gluten-free",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "only include gluten-free meals.",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filters.lactoseFree]!,
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filters.lactoseFree, isChecked);
          },
          title: Text(
            "Lactose-free",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "only include lactose-free meals.",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filters.vegetarian]!,
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filters.vegetarian, isChecked);
          },
          title: Text(
            "Vegetarian",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "only include vegetarian meals.",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filters.vegan]!,
          onChanged: (isChecked) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filters.vegan, isChecked);
          },
          title: Text(
            "Vegan",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "only include vegan meals.",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        )
      ]),
    );
  }
}
