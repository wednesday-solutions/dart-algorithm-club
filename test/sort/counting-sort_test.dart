import 'package:dart_algorithm_club/sort/counting-sort.dart';
import 'package:test/test.dart';

void main() {
  List<num> dataSource;

  setUp(() {
    dataSource = [0, 9, 6, 3];
  });

  group('Tests for Counting sort', () {
    test('countingSort should sort the array in ascending order', () {
      expect(countingSort(dataSource), [0, 3, 6, 9]);
    });
  });
}
