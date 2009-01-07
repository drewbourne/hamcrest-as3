package org.hamcrest.core {
   
  import org.hamcrest.Description;
  import org.hamcrest.Matcher;
  import org.hamcrest.TypeSafeDiagnosingMatcher;
  
  public class ThrowsMatcher extends TypeSafeDiagnosingMatcher {

    private var _matcher:Matcher;

    public function ThrowsMatcher(matcher:Matcher) {
      
      super(Function);
      _matcher = matcher;
    }
    
    override public function matchesSafely(item:Object, mismatchDescription:Description):Boolean {
      
      var fn:Function = item as Function;
      var thrown:Boolean = false;
      var error:Error = null;
      
      try {
        fn();
      } 
      catch (e:Error) {
        error = e;
        if (_matcher.matches(e)) {
          thrown = true;
        } else {
          throw e;
        }
      } 
      finally {  
        
        _matcher.describeMismatch(error, mismatchDescription);
        return thrown;
      }
    }
    
    override public function describeTo(description:Description):void {
      
      description.appendDescriptionOf(_matcher).appendText(" to be thrown");
    }
  }
}
