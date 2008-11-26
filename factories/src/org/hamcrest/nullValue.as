package org.hamcrest {

  import org.hamcrest.core.IsNullMatcher;
  
  public function nullValue():Matcher {
    return new IsNullMatcher();
  }
}