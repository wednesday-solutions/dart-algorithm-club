import 'package:dart_algorithm_club/data-structures/heap/max-heap.dart';
import 'package:dart_algorithm_club/data-structures/heap/min-heap.dart';
import 'package:test/test.dart';

void main() {
  MaxHeap maxHeap;
  MinHeap minHeap;

  setUp(() {
    minHeap = MinHeap([40, 50, 15, 30, 10, 100, 40]);
    maxHeap = MaxHeap([40, 50, 15, 30, 10, 100, 40]);
  });

  group('Tests for the Heap data structure', () {
    test('should heapify the max and min heaps correctly', () {
      expect(minHeap.heapContainer, [10, 30, 15, 40, 50, 100, 40]);
      expect(maxHeap.heapContainer, [100, 50, 40, 30, 10, 40, 15]);
    });

    test('.addItem() should ensure the min and max heaps are maintain order', () {
      minHeap.addItem(1);
      maxHeap.addItem(200);
      expect(minHeap.heapContainer, [1, 10, 15, 30, 50, 100, 40, 40]);
      expect(maxHeap.heapContainer, [200, 100, 40, 50, 10, 40, 15, 30]);
    });
  });
}
