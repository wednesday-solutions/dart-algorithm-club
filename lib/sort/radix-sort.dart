import 'package:dart_algorithm_club/utils/max-num.dart';

List<num> radixSort(List<num> elements) {
  var sortedList = List<num>.from(elements);
  var maxElement = sortedList.max();

  for (var radix = 1; (maxElement / radix).floor() > 0; radix *= 10) {
    sortedList = countingSort(sortedList, radix);
  }
  return sortedList;
}

List<num> countingSort(List<num> elements, num radix) {
  var countList = List.generate(10, (index) => 0);
  elements.forEach((element) {
    countList[((element/radix) % 10).floor()] += 1;
  });

  for (var index = 1; index < 10; index++) {
    var sum = countList[index] + countList[index - 1];
    countList[index] = sum;
  }

  var sortedList = List.generate(elements.length, (index) => 0);
  for (var index = elements.length - 1; index >= 0; index--) {
    sortedList[countList[((elements[index]/radix) % 10).floor()] - 1] = elements[index];
    countList[((elements[index] / radix) % 10).floor()] -= 1;
  }
  return sortedList;
}