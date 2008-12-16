package org.hamcrest {
  
  public class AssertionError extends Error {

    private var _cause:Error;

    public function AssertionError(message:String, cause:Error = null) {

      super(message);
      
      _cause = cause;
    }

    public function get cause():Error {

      return _cause;
    }
  }
}