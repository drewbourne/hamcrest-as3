package org.hamcrest {
  
  public interface Matcher extends SelfDescribing {
    
    function matches(item:Object):Boolean;
    function describeMismatch(item:Object, mismatchDescription:Description):void;
  }
}