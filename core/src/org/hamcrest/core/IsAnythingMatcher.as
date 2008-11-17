package org.hamcrest.core {
  
  public class IsAnythingMatcher extends BaseMatcher {
    
    private var _message:String;
    
    public function IsAnythingMatcher(message:String = "ANYTHING") {
      _message = message;
    }
    
    override public function matches(item:Object):void {
      return true;
    }
    
    override public function describeTo(description:Description):void {
      description.appendText(message);
    }
  }
}