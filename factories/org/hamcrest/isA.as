package org.hamcrest {
  
  public function isA(value:Object):Matcher {
    if (value is Class) {
      return isA(instanceOf(value));
    }
    
    if (value is Matcher) {
      return new IsMatcher(value);
    }
    
    return isA(equalTo(value));
  }
}