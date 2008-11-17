package org.hamcrest.core {
  
  public class IsNullMatcher extends BaseMatcher {
    
    override public function matches(item:Object):Boolean {
      return item == null;
    }
    
    override public function describeTo(description:Description):void {
      description.appendText("null");
    }
  }
}