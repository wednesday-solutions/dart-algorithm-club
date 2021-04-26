import 'package:dart_algorithm_club/sort/radix-sort.dart';
import 'package:test/test.dart';

void main() {
  List<num> dataSource;

  setUp(() {
    dataSource = [9, 1, 2, 6, 8];
  });

  group('Tests for Radix sort', () {
    test('It should sort the input array in ascending order', () {
      expect(radixSort(dataSource), [1, 2, 6, 8, 9]);
    });
  });
}
