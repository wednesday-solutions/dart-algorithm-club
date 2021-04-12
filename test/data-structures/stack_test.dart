import 'package:dart_algorithm_club/data-structures/stack/stack.dart';
import 'package:test/test.dart';

void main() {
  List<num> stack;
  List<num> emptyStack;

  setUp(() {
    stack = [1, 1.2, 1.4];
    emptyStack = [];
  });

  group('Tests for the Stack data structure', () {
    test('.peek() should return the first item in the stack', () {
      expect(stack.peek(), 1.4);
    });

    test('.peek() should return null if the stack is empty', () {
      expect(emptyStack.peek(), null);
    });

    test('.push() should add an element to the top of the stack', () {
      stack.push(1.5);
      expect(stack.peek(), 1.5);
    });

    test('.pop() should remove the last element from the stack', () {
      final topElement = stack.pop();
      expect(topElement, 1.4);
      expect(stack.length, 2);
    });

    test('.pop() should throw an error if the stack is empty', () {
      try {
        emptyStack.pop();
      } catch (e) {
        expect(e, IndexError);
      }
    });
  });
}
