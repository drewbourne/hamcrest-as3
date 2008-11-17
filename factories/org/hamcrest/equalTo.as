package org.hamcrest {
  
  public function equalTo(value:Object):Matcher {
    return new IsEqualMatcher(value);
  }
}