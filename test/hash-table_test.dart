import 'package:dart_algorithm_club/data-structures/hash-table/hash-table.dart';
import 'package:test/test.dart';

void main() {
  HashTable<int, String> hashTable;

  setUp(() {
    hashTable = HashTable(capacity: 5);
  });

  group('Tests for the Hash table data structure', () {
    test('update() should add an item to the hash table if it isnt present', () {
      hashTable.update(5, 'Test');
      expect(hashTable.valueForKey(5), 'Test');
    });

    test('update() should update an item to the hash table if it isnt present', () {
      hashTable.update(5, 'Test');
      hashTable.update(5, 'Testing');
      expect(hashTable.valueForKey(5), 'Testing');
    });

    test('valueForKey() should return the value for the key', () {
      hashTable.update(5, 'Testing');
      expect(hashTable.valueForKey(5), 'Testing');
    });

    test('remove() should remove the element from the hash table', () {
      hashTable.update(5, 'TEst');
      hashTable.remove(5);
      expect(hashTable.valueForKey(5), null);
    });
  });
}
