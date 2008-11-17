package org.hamcrest {
  
  public class BaseMatcher implements Matcher {
    
    public function matches():Boolean {
      throw new IllegalOperationError('BaseMatcher#matches must be override by subclass');
    }
    
    public function describeMismatch(item:Object, mismatchDescription:Description):void {
      mismatchDescription.appendText("was ").appendValue(item);
    }
    
    public function describeTo(description:Desciption):void {
      throw new IllegalOperationError('BaseMatcher#describeTo must be override by subclass');
    }
    
    public function toString():String {
      return StringDescription.toString(this);
    }
  }
}