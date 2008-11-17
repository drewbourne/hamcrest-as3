package org.hamcrest {
  
  public function startsWith(substring:String):Matcher {
    return new StringStartsWithMatcher(substring);
  }
}