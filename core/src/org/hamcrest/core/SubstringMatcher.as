package org.hamcrest.core {
  
  import org.hamcrest.Description;
  import org.hamcrest.TypeSafeMatcher;
  
  import flash.errors.IllegalOperationError;
  
  public class SubstringMatcher extends TypeSafeMatcher {
    
    private var _substring:String;
    
    public function SubstringMatcher(substring:String) {
      super(String);
      _substring = substring;
    }
    
    protected function get substring():String {
      return _substring;
    }
    
    override public function matchesSafely(item:Object):Boolean {
      return evalSubstringOf(item as String);
    }
    
    override public function describeTo(description:Description):void {
      description.appendText("a string ").appendText(relationship()).appendText(" ").appendValue(_substring);
    }
    
    protected function evalSubstringOf(item:String):Boolean {
      throw new IllegalOperationError("SubstringMatcher#evalueSubstringOf must be override by subclass");
    }
    
    protected function relationship():String {
      throw new IllegalOperationError("SubstringMatcher#relationship must be override by subclass");
    }
  }
}