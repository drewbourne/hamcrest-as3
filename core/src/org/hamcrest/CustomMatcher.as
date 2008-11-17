package org.hamcrest {
  
  public class CustomMatcher extends BaseMatcher {
    
    private var _fixedDescription:String;
    private var _matchesFunc:Function;
    
    public function CustomTypeSafeMatcher(description:String, expectedType:Class, matchesFunc:Function) {
      
      if (description == null) {
        throw new ArgumentError('description must be non null');
      }
      
      if (matchesFunc == null) {
        throw new ArgumentError('matchesFunc must be non null');
      }
      
      super(expectedType);
      
      _fixedDescription = description;
      _matchesFunc = matchesFunc;
    }
    
    override public function matches(item:Object):void {
      return _matchesFunc(item);
    }
    
    override public function describeTo(description:Description):void {
      description.appendText(_fixedDescription);
    }
  }
}