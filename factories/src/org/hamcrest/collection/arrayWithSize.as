package org.hamcrest.collection {
  
  import org.hamcrest.Matcher;
  import org.hamcrest.core.IsEqualMatcher;
  import org.hamcrest.equalTo;
  
  public function arrayWithSize(size:Object):Matcher {
    
    if (size is IsEqualMatcher) {
      return new IsArrayWithSizeMatcher(size as Matcher);
    } else if (size is Number || size is int || size is uint) {
      return arrayWithSize(equalTo(size));
    } else {
      throw new ArgumentError("Expecting Number, int, or uint for size, received:" + size);
    }
  }
}