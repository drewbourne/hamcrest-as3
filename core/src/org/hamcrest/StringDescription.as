package org.hamcrest {
  
  public class StringDescription extends BaseDescription {
    
    public static function toString(selfDescribing:SelfDescribing):String {
        return (new StringDescription()).appendDescriptionOf(selfDescribing).toString();
    }
    
    private var _out:String = "";
    
    public function StringDescription() {
      _out = "";
    }
    
    public function append(string:String):void {
      _out += string;
    }
    
    public function toString():String {
      return _out;
    }
  }
}