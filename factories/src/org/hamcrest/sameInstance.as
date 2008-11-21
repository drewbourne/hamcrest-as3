package org.hamcrest {
  
  public function sameInstance(value:Object):Matcher {
    return new IsSameMatcher(value);
  }
}