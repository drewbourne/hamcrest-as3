package org.hamcrest.core {
  
  import org.hamcrest.BaseMatcher;
  import org.hamcrest.Description;
  import org.hamcrest.Matcher;
  
  public class DescribedAsMatcher extends BaseMatcher {
    
    private static const ARG_PATTERN:RegExp = /%([\d+])/g;
    
    private var _descriptionTemplate:String;
    private var _matcher:Matcher;
    private var _values:Array;
    
    public function DescribedAsMatcher(descriptionTemplate:String, matcher:Matcher, values:Array) {
      
      _descriptionTemplate = descriptionTemplate;
      _matcher = matcher;
      _values = values;
    }
    
    override public function matches(item:Object):Boolean {
      
      return _matcher.matches(item);
    }
    
    override public function describeTo(description:Description):void {
      
      var textStart:int = 0;
      _descriptionTemplate.replace(ARG_PATTERN, function(...rest):String {
        trace(rest);
        
        var index:int = rest[1];
        description.appendText(_descriptionTemplate.substring(textStart, rest[2]));
        description.appendValue(_values[index]);
        textStart = rest[2] + rest[1].length + 1;
        return "";
      });
      
      if (textStart < _descriptionTemplate.length) {
        description.appendText(_descriptionTemplate.substring(textStart));
      }
    }
  }
}