package org.hamcrest.core {
  
  import flexunit.framework.*;
  
  import org.hamcrest.*;
  
  public class AnyOfTest extends AbstractMatcherTestCase {
    
    public function testEvaluatesToTheTheLogicalDisjunctionOfTwoOtherMatchers():void {
      
      assertThat("good", anyOf(equalTo("bad"), equalTo("good")));
      assertThat("good", anyOf(equalTo("good"), equalTo("good")));
      assertThat("good", anyOf(equalTo("good"), equalTo("bad")));

      assertThat("good", not(anyOf(equalTo("bad"), equalTo("bad"))));
    }

    public function testEvaluatesToTheTheLogicalDisjunctionOfManyOtherMatchers():void {
      
      assertThat("good", anyOf(equalTo("bad"), equalTo("good"), equalTo("bad"), equalTo("bad"), equalTo("bad")));
      assertThat("good", not(anyOf(equalTo("bad"), equalTo("bad"), equalTo("bad"), equalTo("bad"), equalTo("bad"))));
    }
    
    public function testSupportsMixedTypes():void {
      
      fail('not tested');
    }
    
    public function testHasAReadableDescription():void {
      assertDescription("(\"good\" or \"bad\" or \"ugly\")", 
        anyOf(equalTo("good"), equalTo("bad"), equalTo("ugly")));
    }
  }
}