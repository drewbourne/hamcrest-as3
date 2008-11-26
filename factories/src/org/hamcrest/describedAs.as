package org.hamcrest {
  
  import org.hamcrest.core.DescribedAsMatcher;
  
  public function describedAs(description:String, matcher:Matcher, ...values):Matcher {
    return new DescribedAsMatcher(description, matcher, values);
  };
}