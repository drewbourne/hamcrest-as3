package org.hamcrest.collection {
  
  import org.hamcrest.TypeSafeMatcher;
  import org.hamcrest.Description;
  import org.hamcrest.Matcher;
  
  public class IsArrayWithSizeMatcher extends TypeSafeMatcher {
    
    private var _sizeMatcher:Matcher;
    
    public function IsArrayWithSizeMatcher(sizeMatcher:Matcher) {
      super(Array);
      _sizeMatcher = sizeMatcher;
    }
    
    override public function matchesSafely(item:Object):Boolean {
      return _sizeMatcher.matches((item as Array).length);
    }
    
    override public function describeTo(description:Description):void {
      description.appendText("an array with size ")
          .appendDescriptionOf(_sizeMatcher);
    }
  }
}