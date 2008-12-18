package org.hamcrest.collection {
  
  import org.hamcrest.collection.IsArrayMatcher;
  import org.hamcrest.Matcher;
  
  /**
   * Evaluates to true only if each matcher[i] is satisfied by array[i].
   */
  public function array(...elementMatchers):Matcher {
    return new IsArrayMatcher(elementMatchers);
  }
}