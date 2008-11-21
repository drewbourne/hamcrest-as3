package org.hamcrest {
  
  public function instanceOf(type:Class) {
    return new IsInstanceOfMatcher(type);
  }
}