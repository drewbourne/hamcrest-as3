package org.hamcrest {
  
  public class TypeSafeMatcher extends BaseMatcher {
    
    public function TypeSafeMatcher(expectedType:Class) {
      
      if (expectedType == null) {
        throw new ArgumentError('expectedType must be non null');
      }
      
      _expectedType = expectedType;
    }
    
    public function matchesSafely(item:Object, mismatchDescription:Description):void {
      
      throw new IllegalOperationError('TypeSafeMatcher#matchesSafely is abstract and must be override in subclass');
    }
    
    public final function matches(item:Object):Boolean {
      
      return item != null
          && item is _expectedType
          && matchesSafely(item);
    }
  }
}