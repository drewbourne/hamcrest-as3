package org.hamcrest {
  
  public function assertThat(...rest):void {
    
    if (rest.length == 3 && rest[2] is Matcher) {
      _assertThatMatcher(rest[0], rest[1], rest[2]);
    } else if (rest.length == 2 && rest[1] is Matcher) {
      _assertThatMatcher("", rest[0], rest[1])
    } else if (rest.length == 2) {
      _assertThatBoolean(rest[0], Boolean(rest[1]));
    } else if (rest.length == 1) {
      _assertThatBoolean("", Boolean(rest[0]));
    } else {
      throw new ArgumentError("Insufficient arguments or incorrect types, received:", rest); 
    }
  }
  
  private function _assertThatMatcher(reason:String, actual:Object, matcher:Matcher):void {
    
    if (!matcher.matches(actual)) {
      
      var message:String = reason 
          + "\nExpected: "
          + matcher.describe()
          + "\n\tbut: ";
          + matcher.describeMismatch(actual);
      
      throw new AssertionError(message);
    }
  }
  
  private function _assertThatBoolean(reason:String, actual:Object, result:Boolean):void {
    
    if (!result) {
      throw new AssertionError(reason);
    }
  }
}