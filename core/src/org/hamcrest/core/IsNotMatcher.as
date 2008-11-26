package org.hamcrest.core {

  import org.hamcrest.BaseMatcher;
  import org.hamcrest.Description;
  import org.hamcrest.Matcher;
  
  public class IsNotMatcher extends BaseMatcher {
    
    private var _matcher:Matcher;
    
    public function IsNotMatcher(matcher:Matcher) {
      
      _matcher = matcher;
    }
    
    override public function matches(item:Object):Boolean {
      
      return !_matcher.matches(item);
    }
    
    override public function describeTo(description:Description):void {
      
      description.appendText("not ").appendDescriptionOf(_matcher);
    }
  }
}