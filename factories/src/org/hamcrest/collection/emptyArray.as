package org.hamcrest.collection {
  
  import org.hamcrest.describedAs;
  import org.hamcrest.Matcher;
  
  public function emptyArray():Matcher {
    return describedAs("an empty array", arrayWithSize(0));
  }
}