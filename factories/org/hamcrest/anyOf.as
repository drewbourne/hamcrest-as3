package org.hamcrest {
  
  import org.hamcrest.Matcher;
  import org.hamcrest.core.AllOfMatcher;
  
  /**
   * Factory method for AnyOfMatcher
   *  
   * @example
   * <listing version="3.0">
   *  import org.hamcrest.*
   *  
   *  public function testAnyOf():void {
   *    assertThat("good", anyOf(equalTo("bad"), equalTo("good")));
   *  }
   * </listing>
   */
  public function anyOf(...rest):Matcher {
    return new AnyOfMatcher(rest);
  }
}