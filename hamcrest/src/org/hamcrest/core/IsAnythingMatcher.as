package org.hamcrest.core {

  import org.hamcrest.BaseMatcher;
  import org.hamcrest.Description;
  
  public class IsAnythingMatcher extends BaseMatcher {
    
    private var _message:String;
    
    public function IsAnythingMatcher(message:String = null) {
      super();
      _message = message || "ANYTHING";
    }
    
    override public function matches(item:Object):Boolean {
      return true;
    }
    
    override public function describeTo(description:Description):void {
      description.appendText(_message);
    }
  }
}