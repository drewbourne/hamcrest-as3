package org.hamcrest {

  import flash.errors.IllegalOperationError;
  
  public class DiagnosingMatcher extends BaseMatcher {
    
    override public function matches(item:Object):Boolean {
      return matchesOrDescribesMismatch(item, new NullDescription());
    }
    
    override public function describeMismatch(item:Object, description:Description):void {
      matchesOrDescribesMismatch(item, description);
    }
    
    protected function matchesOrDescribesMismatch(item:Object, description:Description):Boolean {
      throw new IllegalOperationError('DiagnosingMatcher#matches is abstract and must be overriden in a subclass');
    }
  }
}
