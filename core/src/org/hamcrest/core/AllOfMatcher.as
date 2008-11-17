package org.hamcrest.core {
  
  import org.hamcrest.Matcher;
  
  public class AllOf extends DiagnosingMatcher {
    
    private var _matchers:Array;
    
    public function AllOf(matchers:Array) {
      
      _matchers = matchers || [];
    }
    
    public function matchesOrDescribesMismatch(item:Object, mismatchDescription:Description):Boolean {

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
      description.appendList("(", " and ", ")", matchers);
    }
  }
}