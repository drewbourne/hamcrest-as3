package org.hamcrest {
  
  public function assertThatMatcher(reason:String, actual:Object, matcher:Matcher):void {

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
}
