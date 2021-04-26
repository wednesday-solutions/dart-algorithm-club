extension MaxComparableElement on List<num> {
  num max() {
    var maxElement = this[0];
    var looper = iterator;
    while(looper.moveNext()) {
      if(looper.current.compareTo(maxElement) > 0) {
        maxElement = looper.current;
      }
    }
    return maxElement;
  }
}

List<num> countingSort(List<num> elements) {
  var maxElement = elements.max();
  var countList = List.generate(maxElement + 1, (index) => 0);
  elements.forEach((element) {
    countList[element] += 1;
  });

  for (var index = 1; index < countList.length; index++) {
    var sum = countList[index] + countList[index - 1];
    countList[index] = sum;
  }

  var sortedList = List.generate(elements.length, (index) => 0);
  for (var index = elements.length - 1; index > 0; index--) {
    var element = elements[index];
    countList[element] -= 1;
    sortedList[countList[element]] = element;
  }
  return sortedList;
}
