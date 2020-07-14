import 'package:dart_algorithm_club/data-structures/doubly-linked-list/doubly-linked-list-node.dart';
import 'package:dart_algorithm_club/data-structures/doubly-linked-list/doubly-linked-list.dart';
import 'package:test/test.dart';

void main() {
  DoublyLinkedList<num> doublyLinkedList;

  setUp(() {
    doublyLinkedList = DoublyLinkedList();
  });

  group('Tests for the Doubly Linked List data structure', () {
    test('.count should return length of the linked list', () {
      doublyLinkedList.append(100);
      expect(doublyLinkedList.count, 1);
    });

    test('.last and .head should point to the same element if there is only one item in the linked list', () {
      doublyLinkedList.append(100);
      expect(doublyLinkedList.last.value, doublyLinkedList.head.value);
    });

    test('.last should point to the last item in the linked list', () {
      doublyLinkedList.append(100);
      doublyLinkedList.append(50);
      expect(doublyLinkedList.last.value, 50);
    });

    test('.append should add a new node with the value passed to the linked list', () {
      doublyLinkedList.append(100);
      expect(doublyLinkedList.last.value, 100);
    });

    test('.appendNode should add a new node to the linked list', () {
      final node = DoublyLinkedListNode(100);
      doublyLinkedList.appendNode(node);
      expect(doublyLinkedList.last.value, 100);
    });

    test('.toArray() should return an array of values in the linked list', () {
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);
      expect(doublyLinkedList.toArray(), [100, 100, 100]);
    });

    test('.insert() should insert a value at an index in the linked list', () {
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);

      doublyLinkedList.insert(50, 1);
      doublyLinkedList.insert(50, 3);
      expect(doublyLinkedList.toArray(), [100, 50, 100, 50, 100]);
    });

    test('.removeLast() should remove the last item from the linked list', () {
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);

      expect(doublyLinkedList.removeLast(), 100);
      expect(doublyLinkedList.toArray(), [100, 100]);
    });

    test('.remove() should remove the item at an index from the linked list', () {
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);
      doublyLinkedList.append(100);

      expect(doublyLinkedList.remove(1), 100);
      expect(doublyLinkedList.toArray(), [100, 100]);
    });

    test('.removeNode() should remove the node from the linked list', () {
      final nodeToRemove = DoublyLinkedListNode<num>(120);

      doublyLinkedList.append(100);
      doublyLinkedList.appendNode(nodeToRemove);
      doublyLinkedList.append(150);

      final nodeRemoved = doublyLinkedList.removeNode(nodeToRemove);
      expect(nodeRemoved.value, 120);
      expect(doublyLinkedList.toArray(), [100, 150]);
    });

    test('.reverse() should reverse the linked list', () {
      doublyLinkedList.append(100);
      doublyLinkedList.append(120);
      doublyLinkedList.append(150);

      expect(doublyLinkedList.reverse().toArray(), [150, 120, 100]);
    });
  });
}
