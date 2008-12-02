package org.hamcrest {
  
  import org.hamcrest.core.StringEndsWithMatcher;
  
  public function endsWith(substring:String):Matcher {
    return new StringEndsWithMatcher(substring);
  }
}