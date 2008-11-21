package org.hamcrest {
  
  public function hasItem(value:Object, i:int = 0, a:Array = null):Matcher {
    if (value is Matcher) {
      return _hasItemElementMatcher(value as Matcher);
    } else {
      return _hasItemValue(value);
    }
  }
  
  public function hasItems(...rest):Matcher {
    return allOf(rest.map(hasItem));
  }
  
  private function _hasItemValue():Matcher {
    return hasItem(equalTo(value));
  }
  
  private function _hasItemElementMatcher(elementMatcher:Matcher):Matcher {
    return new IsCollectionContainingMatcher(elementMatcher);
  }
}