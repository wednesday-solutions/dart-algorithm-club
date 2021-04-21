List<T> sortInAscendingOrder<T extends Comparable>(List<T> elements) {
  return mergeSort(elements, (a, b) => a.compareTo(b) < 0);
}

List<T> sortInDescendingOrder<T extends Comparable>(List<T> elements) {
  return mergeSort(elements, (a, b) => a.compareTo(b) > 0);
}

List<T> mergeSort<T extends Comparable>(List<T> elements, bool Function(T a, T b) comparator) {
  if (elements.length <= 1) {
    return elements;
  }
  var middleIndex = (elements.length/2).floor();
  var leftArray = mergeSort(elements.sublist(0, middleIndex), comparator);
  var rightArray = mergeSort(elements.sublist(middleIndex, elements.length), comparator);
  return merge(leftArray, rightArray, comparator);
}

List<T> merge<T extends Comparable>(List<T> leftArray, List<T> rightArray, bool Function(T a, T b) comparator) {
  var leftIndex = 0;
  var rightIndex = 0;
  var orderedArray = <T>[];

  while (leftIndex < leftArray.length && rightIndex < rightArray.length) {
    if (comparator(leftArray[leftIndex], rightArray[rightIndex])) {
      orderedArray.add(leftArray[leftIndex]);
      leftIndex += 1;
    } else {
      orderedArray.add(rightArray[rightIndex]);
      rightIndex += 1;
    }
  }

  if (leftIndex < leftArray.length) {
    orderedArray.addAll(leftArray.sublist(leftIndex, leftArray.length));
  }

  if (rightIndex < rightArray.length) {
    orderedArray.addAll(rightArray.sublist(rightIndex, rightArray.length));
  }
  return orderedArray;
}