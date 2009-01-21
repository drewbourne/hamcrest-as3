package org.hamcrest {
  
  public function assertThatMatcher(reason:String, actual:Object, matcher:Matcher):void {

    if (!matcher.matches(actual)) {

      var description:Description = new StringDescription();
      if (reason && reason.length > 0) {
        description.appendText(reason).appendText("\n");
      }
      
      description.appendText("Expected: ")
                 .appendDescriptionOf(matcher)
                 .appendText("\n     but: ")
      matcher.describeMismatch(actual, description);

      throw new AssertionError(description.toString());
    }
  }
}
