
import 'package:dart_algorithm_club/data-structures/heap/heap.dart';

class MaxHeap<T extends Comparable> extends Heap {
  MaxHeap(List<T> heapContainer) : super(heapContainer);

  @override
  bool pairIsInCorrectOrder(Comparable itemOne, Comparable itemTwo) {
    return itemOne.compareTo(itemTwo) > 0;
  }
}
