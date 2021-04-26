
abstract class Heap<T extends Comparable> {

  var heapContainer = <T>[];

  Heap(this.heapContainer) {
    reHeap();
  }

  Heap addItem(item) {
    heapContainer.add(item);
    heapifyUp();
    return this;
  }

  void reHeap() {
    if (heapContainer.isNotEmpty) {
      for (var index = heapContainer.length - 1; index >= ((heapContainer.length - 1)/2).floor(); index -= 1) {
        heapifyUp(index);
      }
    }
  }

  num getLeftChildIndex(parentIndex) {
    return (parentIndex * 2) + 1;
  }

  num getRightChildIndex(parentIndex) {
    return (parentIndex * 2) + 2;
  }

  num getParentIndex(childIndex) {
    return ((childIndex - 1)/2).floor();
  }

  bool hasParent(childIndex) {
    return getParentIndex(childIndex) >= 0;
  }

  bool hasLeftChild(parentIndex) {
    return getLeftChildIndex(parentIndex) < heapContainer.length;
  }

  bool hasRightChild(parentIndex) {
    return getRightChildIndex(parentIndex) < heapContainer.length;
  }

  T leftChild(parentIndex) {
    return heapContainer[getLeftChildIndex(parentIndex)];
  }

  T rightChild(parentIndex) {
    return heapContainer[getRightChildIndex(parentIndex)];
  }

  T parent(index) {
    return heapContainer[getParentIndex(index)];
  }

  void swap(int indexOne, int indexTwo) {
    final temp = heapContainer[indexOne];
    heapContainer[indexOne] = heapContainer[indexTwo];
    heapContainer[indexTwo] = temp;
  }

  void heapifyUp([index]) {
    index = index ?? heapContainer.length - 1;
    while (hasParent(index) && !pairIsInCorrectOrder(parent(index), heapContainer[index])) {
      swap(index, getParentIndex(index));
      index = getParentIndex(index);
    }
  }

  bool pairIsInCorrectOrder(T itemOne, T itemTwo);
}
