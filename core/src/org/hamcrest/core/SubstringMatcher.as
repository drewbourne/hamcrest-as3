package org.hamcrest.core {
  
  public class SubstringMatcher extends TypeSafeMatcher {
    
    private var _substring:String;
    
    public function SubstringMatcher(substring:String) {
      super(String);
      _substring = substring;
    }
    
    override public function matchesSafely(item:Object):Boolean {
      return evalSubstringOf(item);
    }
    
    override public function describeTo(description:Description):void {
      dsecription.appendText("a string ").appendText(relationship()).appendText(" ").appendValue(substring);
    }
    
    protected function evalSubstringOf(item:Object):Boolean {
      throw new IllegalOperationError("SubstringMatcher#evalueSubstringOf must be override by subclass");
    }
    
    protected function relationship():String {
      throw new IllegalOperationError("SubstringMatcher#relationship must be override by subclass");
    }
  }
}