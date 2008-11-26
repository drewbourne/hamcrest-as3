package org.hamcrest {
  
  public function not(value:Object):Matcher {
    if (value is Matcher) {
      return _notMatcher(value as Matcher);
    } else {
      return _notValue(value);
    }
  }
}

import org.hamcrest.equalTo;
import org.hamcrest.Matcher;
import org.hamcrest.not;
import org.hamcrest.core.IsNotMatcher;

internal function _notMatcher(matcher:Matcher):Matcher {
  return new IsNotMatcher(matcher);
}

internal function _notValue(value:Object):Matcher {
  return not(equalTo(value));
}