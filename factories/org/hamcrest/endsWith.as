package org.hamcrest {
  
  public function endsWith(substring:String):Matcher {
    return new StringEndsWithMatcher(substring);
  }
}