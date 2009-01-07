package org.hamcrest.core {
   
  import org.hamcrest.Description;
  import org.hamcrest.TypeSafeMatcher;
  
  public class ThrowsMatcher extends TypeSafeMatcher {

    private var _expectedErrorType:Class;

    public function ThrowsMatcher(expectedErrorType:Class) {
      
      super(Function);
      _expectedErrorType = expectedErrorType;
    }
    
    override public function matchesSafely(item:Object):Boolean {
      
      var fn:Function = item as Function;
      var thrown:Boolean = false;
      
      try {
        fn();
      } catch (e:Error) {
        if (e is _expectedErrorType) {
          thrown = true;
        } else {
          throw e;
        }
      } finally {
        return thrown;
      }
    }
  }
}
