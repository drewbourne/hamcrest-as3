package org.hamcrest {
  
  import org.hamcrest.Matcher;
  import org.hamcrest.core.EveryMatcher;
  
  public function everyItem(itemMatcher:Matcher):Matcher {
    return new EveryMatcher(itemMatcher);
  }
}