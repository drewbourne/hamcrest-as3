package org.hamcrest {
  
  public function anything(message:String = null):Matcher {
    return new IsAnythingMatcher(message);
  }
}