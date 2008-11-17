package org.hamcrest.core {
  
  public class IsNotMatcher implements Matcher {
    
    private var _matcher:Matcher;
    
    public function IsNotMatcher(matcher:Matcher) {
      
      _matcher = matcher;
    }
    
    public function matches(item:Object):Boolean {
      
      return !_matcher.matches(item);
    }
    
    public function describeMismatch(item:Object, mismatchDescription:Description):void {
      
      mismatchDescription.append("not ").appendDescriptionOf(_matcher);
    }
  }
}