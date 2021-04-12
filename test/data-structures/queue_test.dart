import 'package:dart_algorithm_club/data-structures/queue/queue.dart';
import 'package:test/test.dart';

void main() {
  List<num> queue;
  List<num> emptyQueue;

  setUp(() {
    queue = [1, 1.2, 1.4];
    emptyQueue = [];
  });

  group('Tests for the Queue data structure', () {
    test('.peek() should return the first item in the queue', () {
      expect(queue.peek(), 1);
    });

    test('.peek() should return null if the queue is empty', () {
      expect(emptyQueue.peek(), null);
    });

    test('.enqueue() should add an element to the end of the queue', () {
      queue.enqueue(1.5);
      expect(queue.peek(), 1);
      expect(queue.length, 4);
    });

    test('.dequeue() should remove the first element from the queue', () {
      final topElement = queue.dequeue();
      expect(topElement, 1);
      expect(queue.length, 2);
    });

    test('.dequeue() should throw an error if the queue is empty', () {
      try {
        emptyQueue.dequeue();
      } catch (e) {
        expect(e, IndexError);
      }
    });
  });
}
