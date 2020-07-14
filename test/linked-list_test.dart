import 'package:dart_algorithm_club/data-structures/linked-list/linked-list-node.dart';
import 'package:dart_algorithm_club/data-structures/linked-list/linked-list.dart';
import 'package:test/test.dart';

void main() {
  LinkedList<num> linkedList;

  setUp(() {
    linkedList = LinkedList();
  });

  group('Tests for the Linked List data structure', () {
    test('.count should return length of the linked list', () {
      linkedList.append(100);
      expect(linkedList.count, 1);
    });

    test('.last and .head should point to the same element if there is only one item in the linked list', () {
      linkedList.append(100);
      expect(linkedList.last.value, linkedList.head.value);
    });

    test('.last should point to the last item in the linked list', () {
      linkedList.append(100);
      linkedList.append(50);
      expect(linkedList.last.value, 50);
    });

    test('.append should add a new node with the value passed to the linked list', () {
      linkedList.append(100);
      expect(linkedList.last.value, 100);
    });

    test('.appendNode should add a new node to the linked list', () {
      final node = LinkedListNode(100);
      linkedList.appendNode(node);
      expect(linkedList.last.value, 100);
    });

    test('.toArray() should return an array of values in the linked list', () {
      linkedList.append(100);
      linkedList.append(100);
      linkedList.append(100);
      expect(linkedList.toArray(), [100, 100, 100]);
    });

    test('.insert() should insert a value at an index in the linked list', () {
      linkedList.append(100);
      linkedList.append(100);
      linkedList.append(100);

      linkedList.insert(50, 1);
      linkedList.insert(50, 3);
      expect(linkedList.toArray(), [100, 50, 100, 50, 100]);
    });

    test('.removeLast() should remove the last item from the linked list', () {
      linkedList.append(100);
      linkedList.append(100);
      linkedList.append(100);

      expect(linkedList.removeLast(), 100);
      expect(linkedList.toArray(), [100, 100]);
    });

    test('.remove() should remove the item at an index from the linked list', () {
      linkedList.append(100);
      linkedList.append(100);
      linkedList.append(100);

      expect(linkedList.remove(1), 100);
      expect(linkedList.toArray(), [100, 100]);
    });

    test('.removeNode() should remove the node from the linked list', () {
      linkedList.append(100);
      linkedList.append(120);
      linkedList.append(150);

      final nodeToRemove = LinkedListNode(120);
      final nodeRemoved = linkedList.removeNode(nodeToRemove);
      expect(nodeRemoved.value, 120);
      expect(linkedList.toArray(), [100, 150]);
    });

    test('.reverse() should reverse the linked list', () {
      linkedList.append(100);
      linkedList.append(120);
      linkedList.append(150);

      expect(linkedList.reverse().toArray(), [150, 120, 100]);
    });
  });
}
