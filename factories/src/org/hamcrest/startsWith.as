package org.hamcrest {

  import org.hamcrest.core.StringStartsWithMatcher;
  
  public function startsWith(substring:String):Matcher {
    return new StringStartsWithMatcher(substring);
  }
}