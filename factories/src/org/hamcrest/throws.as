package org.hamcrest {

  import org.hamcrest.core.ThrowsMatcher;
  
  public function throws(error:Object):Matcher {
    
    if (error is Class) {
      return throws(instanceOf(error as Class));
    } else if (error is Matcher) {
      return new ThrowsMatcher(error as Matcher);
    } else {
      throw new ArgumentError("error must be either Class or Matcher");
    }
  }
}