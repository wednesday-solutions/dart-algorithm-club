extension MaxNum on List<num> {
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