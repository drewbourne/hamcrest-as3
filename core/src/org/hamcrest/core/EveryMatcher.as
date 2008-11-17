package org.hamcrest.core {
  
  public class EveryMatcher extends TypeSafeDiagnosingMatcher {
    
    private var _matcher:Matcher;
    
    public function EveryMatcher(matcher:Matcher) {
      
      super(Array);
      _matcher = matcher;
    }
    
    override public function matchesSafely(collection:Object, mismatchDescription:Description):void {
      
      for each (var item:Object in (collection as Array)) {
        if (!_matcher.matches(item)) {
          mismatchDescription.appendText("an item ");
          _matcher.describeMismatch(item, mismatchDescription);
          return false;
        }
      }
      
      return true;
    }
    
    override public function describeTo(description:Description):void {
      description.appendText("every item is ").appendDescriptionOf(matcher);
    }
  }
}
