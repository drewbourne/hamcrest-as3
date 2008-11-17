package org.hamcrest.core {
  
  import flexunit.framework.*;
  
  public class AnyOfTest extends TestCase {
    
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
  }
}