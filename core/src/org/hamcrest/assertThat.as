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
}

import org.hamcrest.AssertionError;
import org.hamcrest.Matcher;
import org.hamcrest.Description;
import org.hamcrest.StringDescription;

internal function _assertThatMatcher(reason:String, actual:Object, matcher:Matcher):void {
  
  if (!matcher.matches(actual)) {
    
    var description:Description = new StringDescription();
    description.appendText(reason)
               .appendText("\nExpected: ")
               .appendDescriptionOf(matcher)
               .appendText("\n    but: ")
    matcher.describeMismatch(actual, description);
    
    throw new AssertionError(description.toString());
  }
}

internal function _assertThatBoolean(reason:String, result:Boolean):void {
  
  if (!result) {
    throw new AssertionError(reason);
  }
}
