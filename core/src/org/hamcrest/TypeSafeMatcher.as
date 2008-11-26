package org.hamcrest {
  
  import flash.errors.IllegalOperationError;
  
  public class TypeSafeMatcher extends BaseMatcher {
    
    private var _expectedType:Class;
    
    public function TypeSafeMatcher(expectedType:Class) {
      
      if (expectedType == null) {
        throw new ArgumentError('expectedType must be non null');
      }
      
      _expectedType = expectedType;
    }
    
    public function matchesSafely(item:Object):Boolean {
      
      throw new IllegalOperationError('TypeSafeMatcher#matchesSafely is abstract and must be override in subclass');
    }
    
    override public final function matches(item:Object):Boolean {
      
      return item != null
          && item is _expectedType
          && matchesSafely(item);
    }
  }
}