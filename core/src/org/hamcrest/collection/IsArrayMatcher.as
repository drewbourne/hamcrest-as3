package org.hamcrest.collection {
  
  import org.hamcrest.Description;
  import org.hamcrest.Matcher;
  import org.hamcrest.TypeSafeMatcher;
  
  public class IsArrayMatcher extends TypeSafeMatcher {
    
    private var _elementMatchers:Array;
    
    public function IsArrayMatcher(elementMatchers:Array) {
      super(Array);
      _elementMatchers = elementMatchers;
    }
    
    override public function matchesSafely(item:Object):Boolean {
      var array:Array = item as Array;
      if (array.length != _elementMatchers.length) { 
        return false; 
      }
      
      return _elementMatchers.every(function(matcher:Matcher, i:int, a:Array):Boolean {
        return matcher.matches(array[i]);
      });
    }
    
    override public function describeTo(description:Description):void {
      description.appendList(descriptionStart(), descriptionSeparator(), descriptionEnd(), _elementMatchers);
    }
    
    protected function descriptionStart():String {
      return "[";
    }
    
    protected function descriptionSeparator():String {
      return ", ";
    }
    
    protected function descriptionEnd():String {
      return "]";
    }
  }
}