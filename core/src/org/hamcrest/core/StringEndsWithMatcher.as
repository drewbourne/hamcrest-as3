package org.hamcrest.core {
  
  public class StringEndsWithMatcher extends SubstringMatcher {
    
    public function StringEndsWithMatcher(substring:String) {
      super(substring);
    }
    
    override protected function evalSubstringOf(s:String):Boolean {
      // FIXME optimize this by storing the regexp
      return (new RegExp(substring + '$')).test(s);
    }
    
    override protected function relationship():String {
      return "ending with";
    }
  }
}