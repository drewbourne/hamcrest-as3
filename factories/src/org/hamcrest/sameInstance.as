package org.hamcrest {

  import org.hamcrest.core.IsSameMatcher;
  
  public function sameInstance(value:Object):Matcher {
    return new IsSameMatcher(value);
  }
}