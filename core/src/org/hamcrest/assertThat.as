package org.hamcrest {
  
  public function assertThat(...rest):void {
    
    if (rest.length == 3 && rest[2] is Matcher) {
      assertThatMatcher(rest[0], rest[1], rest[2]);
    } else if (rest.length == 2 && rest[1] is Matcher) {
      assertThatMatcher("", rest[0], rest[1])
    } else if (rest.length == 2) {
      assertThatBoolean(rest[0], Boolean(rest[1]));
    } else if (rest.length == 1) {
      assertThatBoolean("", Boolean(rest[0]));
    } else {
      throw new ArgumentError("Insufficient arguments or incorrect types, received:", rest); 
    }
  }
}
