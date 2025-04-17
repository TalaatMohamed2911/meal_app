import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  //القيمة اللي هسمع عليها list<meal>
  FavouriteMealsNotifier() : super([]);
  bool toggleMealFavouriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      // state.remove(meal); ==
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      // state.add(meal); ==
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider((ref) {
  return FavouriteMealsNotifier();
});
