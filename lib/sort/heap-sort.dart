import 'package:dart_algorithm_club/data-structures/heap/max-heap.dart';

List<T> sortInAscendingOrder<T extends Comparable>(List<T> elements) {
  return heapSort(elements).reversed.toList();
}

List<T> sortInDescendingOrder<T extends Comparable>(List<T> elements) {
  return heapSort(elements);
}

List<T> heapSort<T extends Comparable>(List<T> elements) {
  var heapDataSource = List<T>.from(elements);
  var sortedList = <T>[];
  var maxHeap = MaxHeap(heapDataSource);

  while(maxHeap.heapContainer.isNotEmpty) {
    sortedList.add(maxHeap.heapContainer[0]);
    maxHeap.heapContainer.removeAt(0);
    maxHeap.reHeap();
  }
  return sortedList;
}