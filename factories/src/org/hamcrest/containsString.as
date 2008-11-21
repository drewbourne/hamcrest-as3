package org.hamcrest {
  
  public function containsString(substring:String):Matcher {
    return new StringContainsMatcher(substring);
  }
}