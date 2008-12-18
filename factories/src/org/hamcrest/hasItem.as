package org.hamcrest {
  
  import org.hamcrest.core.IsCollectionContainingMatcher;
  
  public function hasItem(value:Object, i:int = 0, a:Array = null):Matcher {
    if (value is Matcher) {
      return new IsCollectionContainingMatcher(value as Matcher); //_hasItemElementMatcher(value as Matcher);
    } else {
      return hasItem(equalTo(value)); //_hasItemValue(value);
    }
  }
}