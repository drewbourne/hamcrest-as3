package org.hamcrest {
  
  import org.hamcrest.core.IsAnythingMatcher;
  
  public function anything(message:String = null):Matcher {
    return new IsAnythingMatcher(message);
  }
}