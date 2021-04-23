import 'package:dart_algorithm_club/utils/swap.dart';

List<T> sortInAscendingOrder<T extends Comparable>(List<T> elements) {
  return slowSort(elements, (a, b) => a.compareTo(b) < 0);
}

List<T> sortInDescendingOrder<T extends Comparable>(List<T> elements) {
  return slowSort(elements, (a, b) => a.compareTo(b) > 0);
}

List<T> slowSort<T extends Comparable>(List<T> elements, bool Function(T a, T b) comparator) {
  var sortedElements = List<T>.from(elements);
  _slowSort(sortedElements, 0, sortedElements.length - 1, comparator);
  return sortedElements;
}

void _slowSort<T extends Comparable>(List<T> elements, var startIndex, var endIndex, bool Function(T a, T b) comparator) {
  if (startIndex >= endIndex) {
    return;
  }
  var m = ((startIndex + endIndex)/2).floor();
  _slowSort(elements, startIndex, m, comparator);
  _slowSort(elements, m + 1, endIndex, comparator);
  if (comparator(elements[endIndex], elements[m])) {
    elements.swap(endIndex, m);
  }
  _slowSort(elements, startIndex, endIndex - 1, comparator);
}
