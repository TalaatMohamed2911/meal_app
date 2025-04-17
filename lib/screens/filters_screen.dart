import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: Column(
        children: [
          customSwitch(
            context,
            'Gluten-free',
            'Only include gluten-free meals',
            activeFilters[Filter.glutenFree]!,
            (bool value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
          ),
          customSwitch(
            context,
            'Vegan',
            'Only include Vegan-free meals',
            activeFilters[Filter.vegan]!,
            (value) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, value);
            },
          ),
          customSwitch(
            context,
            'Lactose-free',
            'Only include Lactose-free meals',
            activeFilters[Filter.lactoseFree]!,
            (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
          ),
          customSwitch(
            context,
            'Vegetarian',
            'Only include gluten-free meals',
            activeFilters[Filter.vegetarian]!,
            (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subTitle,
    bool filter,
    Function(bool newValue) onChanged,
  ) {
    return SwitchListTile(
      value: filter,
      onChanged: onChanged,
      activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
