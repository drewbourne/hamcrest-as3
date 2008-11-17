package org.hamcrest {
  
  public class CustomTypeSafeMatcher extends TypeSafeMatcher {
    
    private var _fixedDescription:String;
    private var _matchesSafelyFunc:Function;
    
    public function CustomTypeSafeMatcher(description:String, expectedType:Class, matchesSafelyFunc:Function) {
      
      if (description == null) {
        throw new ArgumentError('description must be non null');
      }
      
      if (matchesSafelyFunc == null) {
        throw new ArgumentError('matchesSafelyFunc must be non null');
      }
      
      super(expectedType);
      
      _fixedDescription = description;
      _matchesSafelyFunc = matchesSafelyFunc;
    }
    
    override public function matchesSafely(item:Object):void {
      return _matchesSafelyFunc(item);
    }
    
    override public function describeTo(description:Description):void {
      description.appendText(_fixedDescription);
    }
  }
}