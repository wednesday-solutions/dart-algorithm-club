import 'package:dart_algorithm_club/data-structures/binary-tree/binary-tree.dart';
import 'package:test/test.dart';

void main() {

  BinaryTree<String> binaryTree;

  setUp(() {
    final node5 = BinaryTree.createNode('5');
    final nodeA = BinaryTree.createNode('a');
    final node10 = BinaryTree.createNode('10');
    final node4 = BinaryTree.createNode('4');
    final node3 = BinaryTree.createNode('3');
    final nodeB = BinaryTree.createNode('b');

    final aMinus10 = BinaryTree.createNode('-', nodeA, node10);
    final timesLeft = BinaryTree.createNode('*', node5, aMinus10);

    final minus4 = BinaryTree.createNode('-', null, node4);
    final divide3AndB = BinaryTree.createNode('/', node3, nodeB);
    final timesRight = BinaryTree.createNode('*', minus4, divide3AndB);

    binaryTree = BinaryTree.createNode('+', timesLeft, timesRight);
  });

  group('Tests for the Binary Tree data structure', () {
    test('it should return the count of the binary tree', () {
      expect(binaryTree.count(), 12);
    });

    test('it should return the correct order of nodes for pre-order traversal', () {
      var results = <String>[];
      binaryTree.traversePreOrder((data) => results.add(data));
      expect(results.join(' '), '+ * 5 - a 10 * - 4 / 3 b');
    });

    test('it should return the correct order of nodes for in-order traversal', () {
      var results = <String>[];
      binaryTree.traverseInOrder((data) => results.add(data));
      expect(results.join(' '), '5 * a - 10 + - 4 * 3 / b');
    });

    test('it should return the correct order of nodes for post-order traversal', () {
      var results = <String>[];
      binaryTree.traversePostOrder((data) => results.add(data));
      expect(results.join(' '), '5 a 10 - * 4 - 3 b / * +');
    });

    test('it should print the description of the tree correctly', () {
      expect(binaryTree.toString(), 'value: +, left = [value: *, left = [value: 5, left = [null], right = [null]], right = [value: -, left = [value: a, left = [null], right = [null]], right = [value: 10, left = [null], right = [null]]]], right = [value: *, left = [value: -, left = [null], right = [value: 4, left = [null], right = [null]]], right = [value: /, left = [value: 3, left = [null], right = [null]], right = [value: b, left = [null], right = [null]]]]');
    });
  });
}
