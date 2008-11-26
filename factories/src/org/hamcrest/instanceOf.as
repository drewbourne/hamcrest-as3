package org.hamcrest {
  
  import org.hamcrest.core.IsInstanceOfMatcher;
  
  public function instanceOf(type:Class):Matcher {
    return new IsInstanceOfMatcher(type);
  }
}