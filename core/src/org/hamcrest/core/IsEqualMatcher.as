package org.hamcrest.core {

  import org.hamcrest.BaseMatcher;
  import org.hamcrest.Description;
  
  public class IsEqualMatcher extends BaseMatcher {
    
    private var _value:Object;
    
    public function IsEqualMatcher(value:Object) {
      _value = value;
    }
    
    override public function matches(item:Object):Boolean {
      return areEqual(item, _value);
    }
    
    override public function describeTo(description:Description):void {
      description.appendValue(_value);
    }
    
    private function areEqual(o1:Object, o2:Object):Boolean {
      if (o1 == null) {
        return o2 == null;
      } else if (o1 is Array) {
        return o2 is Array && areArraysEqual(o1 as Array, o2 as Array);
      } else {
        return o1 === o2;
      }
    }
    
    private function areArraysEqual(o1:Array, o2:Array):Boolean {
      return areArraysLengthsEqual(o1, o2) && areArrayElementsEqual(o1, o2);
    }
    
    private function areArraysLengthsEqual(o1:Array, o2:Array):Boolean {
      return o1.length == o2.length;
    }
    
    private function areArrayElementsEqual(o1:Array, o2:Array):Boolean {
      for (var i:int = 0, n:int = o1.length; i < n; i++) {
        if (!areEqual(o1[i], o2[i])) {
          return false;
        }
      }
      return true;
    }
  }
}