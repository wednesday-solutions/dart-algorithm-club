import 'package:dart_algorithm_club/utils/swap.dart';

List<T> sortInAscendingOrder<T extends Comparable>(List<T> elements) {
  return shellSort(elements, (a, b) => a.compareTo(b) < 0);
}

List<T> sortInDescendingOrder<T extends Comparable>(List<T> elements) {
  return shellSort(elements, (a, b) => a.compareTo(b) > 0);
}

List<T> shellSort<T extends Comparable>(List<T> elements, bool Function(T a, T b) comparator) {
  var sortedList = List<T>.from(elements);
  for (var gap = (sortedList.length/2).floor(); gap >= 1; gap = (gap/2).floor()) {
    for (var j = gap; j < sortedList.length; j++) {
      for (var i = j - gap; i >= 0; i = i - gap) {
        if (comparator(sortedList[i + gap], sortedList[i])) {
          sortedList.swap(i + gap, i);
        }
      }
    }
  }
  return sortedList;
}
