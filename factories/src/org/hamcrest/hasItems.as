package org.hamcrest {
  
  public function hasItems(...rest):Matcher {
    return allOf.apply(null, rest.map(hasItem));
  }
}
