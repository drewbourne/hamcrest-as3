package org.hamcrest {
  
  public interface Description {
    
    function appendText(text:String):Description;
    
    function appendDescriptionOf(value:SelfDescribing):Description;
    
    function appendValue(value:Object):Description;
    
    function appendList(start:String, separator:String, end:String, list:Array):Description;
  }
}