package org.hamcrest {

  import org.hamcrest.core.ThrowsMatcher;
  
  public function throws(error:Class):Matcher {
    return new ThrowsMatcher(error);
  }
}