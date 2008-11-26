package org.hamcrest.core {
  
  import flash.utils.getQualifiedClassName;
  
  import org.hamcrest.BaseMatcher;
  import org.hamcrest.Description;
  
  public class IsInstanceOfMatcher extends BaseMatcher {
    
    private var _type:Class;
    private var _typeName:String;
    
    public function IsInstanceOfMatcher(type:Class) {
      _type = type;
      _typeName = getQualifiedClassName(type);
    }
    
    override public function matches(item:Object):Boolean {
      return item is _type;
    }
    
    override public function describeTo(description:Description):void {
      description.appendText("an instance of ").appendText(_typeName);
    }
  }
}