package org.hamcrest {
  
  public class TypeSafeDiagnosingMatcher extends BaseMatcher {
    
    private var _expectedType:Class;
    
    public function TypeSafeDiagnosingMatcher(expectedType:Class) {
      
      _expectedType = expectedType;
    }
    
    public function matchesSafely(item:Object, mismatchDescription:Description):void {
      
      throw new IllegalOperationError('TypeSafeDiagnosingMatcher#matchesSafely is abstract and must be override in subclass');
    }
    
    public final function matches(item:Object):Boolean {
      
      return item != null
          && item is _expectedType
          && matchesSafely(item, new NullDescription());
    }
    
    public final function describeMismatch(item:Object, mismatchDescription:Description):void {
      
      return matchesSafely(item, mismatchDescription);
    }
  }
}