import 'package:dart_algorithm_club/data-structures/tree/tree-node.dart';
import 'package:test/test.dart';

void main() {
  TreeNode<num> root;

  setUp(() {
    root = TreeNode(100);
    final child1 = TreeNode(200);
    final child2 = TreeNode(300);
    final child3 = TreeNode(400);
    final child4 = TreeNode(500);

    root.addChild(child1);
    root.addChild(child2);
    child1.addChild(child3);
    child2.addChild(child4);
  });

  group('Tests for the Tree data structure', () {
    test('.search() should return the first item in the tree', () {
      expect(root.search(400).value, 400);
    });
  });
}
