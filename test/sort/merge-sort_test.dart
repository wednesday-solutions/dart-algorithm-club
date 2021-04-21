import 'package:dart_algorithm_club/sort/merge-sort.dart';
import 'package:test/test.dart';

void main() {
  List<num> dataSource;

  setUp(() {
    dataSource = [0, -5, 2, -4];
  });

  group('Tests for Quick sort', () {
    test('sortInAscendingOrder should sort the array in ascending order', () {
      expect(sortInAscendingOrder(dataSource), [-5, -4, 0, 2]);
    });

    test('sortInDescendingOrder should sort the array in descending order', () {
      expect(sortInDescendingOrder(dataSource), [2, 0, -4, -5]);
    });
  });
}
