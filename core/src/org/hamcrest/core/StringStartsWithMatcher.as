package org.hamcrest.core {
  
  public class StringStartsWithMatcher extends SubstringMatcher {
    
    public function StringStartsMatcher(substring:String) {
      super(substring);
    }
    
    override protected function evalSubstringOf(s:String):Boolean {
      // FIXME optimize this by storing the regexp
      return (new RegExp('^' + substring)).test(s);
    }
    
    override protected function relationship():String {
      return "starting with";
    }
  }
}