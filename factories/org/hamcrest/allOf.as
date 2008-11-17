package org.hamcrest {
  
  import org.hamcrest.Matcher;
  import org.hamcrest.core.AllOfMatcher;
  
  /**
   * Factory method for AllOfMatcher
   *  
   * @example
   * <listing version="3.0">
   *  import org.hamcrest.*
   *  
   *  public function testAllOf():void {
   *    assertThat("good", allOf(equalTo("good"), equalTo("good")));
   *  }
   * </listing>
   */
  public function allOf(...rest):Matcher {
    return new AllOfMatcher(rest);
  }
}