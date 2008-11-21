package org.hamcrest {
  
  public class StringDescription extends BaseDescription {
    
    public static function toString(selfDescribing:SelfDescribing):String {
        return (new StringDescription()).appendDescriptionOf(selfDescribing).toString();
    }
    
    private var _out:String = "";
    
    public function StringDescription() {
      _out = "";
    }
    
    override protected function append(string:Object):void {
      _out += String(string);
    }
    
    override public function toString():String {
      return _out;
    }
  }
}