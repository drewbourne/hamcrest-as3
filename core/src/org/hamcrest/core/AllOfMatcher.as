package org.hamcrest.core {
  
  import org.hamcrest.Description;
  import org.hamcrest.DiagnosingMatcher;
  import org.hamcrest.Matcher;
  
  public class AllOfMatcher extends DiagnosingMatcher {
    
    private var _matchers:Array;
    
    public function AllOfMatcher(matchers:Array) {
      
      super();
      _matchers = matchers || [];
    }
    
    override protected function matchesOrDescribesMismatch(item:Object, mismatchDescription:Description):Boolean {

      for each (var matcher:Matcher in _matchers) {
        if (!matcher.matches(item)) {
          mismatchDescription.appendDescriptionOf(matcher).appendText(" ");
          matcher.describeMismatch(item, mismatchDescription);
          return false;
        }
      }
      
      return true;
    }
    
    override public function describeTo(description:Description):void {
      description.appendList("(", " and ", ")", _matchers);
    }
  }
}