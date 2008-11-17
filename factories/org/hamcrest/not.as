packge org.hamcrest {
  
  public function not(value:Object):Matcher {
    if (value is Matcher) {
      return _notMatcher(value);
    } else {
      return _notValue(value);
    }
  }
  
  private function _notMatcher(matcher:Matcher):Matcher {
    return new IsNotMatcher(matcher);
  }
  
  private function _notValue(value:Object):Matcher {
    return not(equalTo(value));
  }
}