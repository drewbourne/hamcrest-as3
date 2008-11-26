package org.hamcrest {
  
  import org.hamcrest.core.IsMatcher;
  
  public function isA(value:Object):Matcher {
    if (value is Class) {
      return isA(instanceOf(value as Class));
    }
    
    if (value is Matcher) {
      return new IsMatcher(value as Matcher);
    }
    
    return isA(equalTo(value));
  }
}