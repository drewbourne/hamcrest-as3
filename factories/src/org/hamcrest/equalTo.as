package org.hamcrest {

  import org.hamcrest.core.IsEqualMatcher;
  
  public function equalTo(value:Object):Matcher {
    return new IsEqualMatcher(value);
  }
}