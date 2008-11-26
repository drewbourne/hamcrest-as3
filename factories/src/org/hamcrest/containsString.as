package org.hamcrest {
  
  import org.hamcrest.core.StringContainsMatcher;
  
  public function containsString(substring:String):Matcher {
    return new StringContainsMatcher(substring);
  }
}