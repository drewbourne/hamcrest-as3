package org.hamcrest.core {
  
  import flexunit.framework.*;
  
  public class AllOfTest extends TestCase {
    
    public function testEvaluatesToTheTheLogicalConjunctionOfTwoOtherMatchers():void {
      
      assertThat("good", allOf(equalTo("good"), equalTo("good")));

      assertThat("good", not(allOf(equalTo("bad"), equalTo("good"))));
      assertThat("good", not(allOf(equalTo("good"), equalTo("bad"))));
      assertThat("good", not(allOf(equalTo("bad"), equalTo("bad"))));
    }
    
    public function testEvaluatesToTheTheLogicalConjunctionOfManyOtherMatchers():void {
      
      assertThat("good", allOf(equalTo("good"), equalTo("good"), equalTo("good"), equalTo("good"), equalTo("good")));
      assertThat("good", not(allOf(equalTo("good"), equalTo("good"), equalTo("bad"), equalTo("good"), equalTo("good"))));
    }
  }
}