package org.hamcrest.core {
  
  import flexunit.framework.*;
  
  import org.hamcrest.AbstractMatcherTestCase;
  import org.hamcrest.allOf;
  import org.hamcrest.equalTo;
  import org.hamcrest.not;
  import org.hamcrest.assertThat;
  
  public class AllOfTest extends AbstractMatcherTestCase {
    
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
    
    public function testHasAReadableDescription():void {
 
      assertDescription("(\"good\" and \"bad\" and \"ugly\")", 
        allOf(equalTo("good"), equalTo("bad"), equalTo("ugly")));
    }
    
    public function testMismatchDescriptionDescribesFirstFailingMatch():void {
      
      assertMismatch("\"good\" was \"bad\"", allOf(equalTo("bad"), equalTo("good")), "bad");
    }
  }
}