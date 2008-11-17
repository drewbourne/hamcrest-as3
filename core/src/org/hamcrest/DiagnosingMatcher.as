package org.hamcrest {
  
  public class DiagnosingMatcher extends BaseMatcher {
    
    public function matches(item:Object):Boolean {
      return matchesOrDescribesMismatch(item, new NullDescription());
    }
    
    public function describeMismatch(item:Object, description:Description):void {
      matchesOrDescribesMismatch(item, description);
    }
    
    protected function matchesOrDescribesMismatch(item:Object, descriptioN:Description):Boolean {
      throw new IllegalOperationError('DiagnosingMatcher#matches is abstract and must be overriden in a subclass');
    }
  }
}