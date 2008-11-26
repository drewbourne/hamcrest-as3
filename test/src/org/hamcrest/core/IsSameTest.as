package org.hamcrest.core {
  
  import org.hamcrest.*;
  
  public class IsSameTest extends AbstractMatcherTestCase {
    
    public function testEvaluatesToTrueIfArgumentIsReferenceToASpecificObject():void {
      
      var o1:Object = {};
      var o2:Object = {};
      
      assertThat(o1, sameInstance(o1));
      assertThat(o2, not(sameInstance(o1)));
    }
    
    public function testReturnsReadableDescriptionFromToString():void {
      assertDescription("sameInstance(\"ARG\")", sameInstance("ARG"));
    }
    
    public function testReturnsReadableDescriptionFromToStringWhenInitializedithNull():void {
      assertDescription("sameInstance(null)", sameInstance(null));
    }
  }
}