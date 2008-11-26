package org.hamcrest.core {

  import org.hamcrest.BaseMatcher;
  import org.hamcrest.Description;
  
  public class IsNullMatcher extends BaseMatcher {
    
    override public function matches(item:Object):Boolean {
      return item == null;
    }
    
    override public function describeTo(description:Description):void {
      description.appendText("null");
    }
  }
}