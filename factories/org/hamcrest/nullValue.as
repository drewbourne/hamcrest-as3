package org.hamcrest {
  
  public function nullValue():Matcher {
    return new IsNullMatcher();
  }
  
  public function notNullValue():Matcher {
    return not(nullValue());
  }
}