package org.hamcrest.text {
  
  import org.hamcrest.*;
  import org.hamcrest.core.*;
  
  public class StringContainsTest extends AbstractMatcherTestCase {
    
    private static const EXCERPT:String = "EXCERPT";
    private var stringContains:Matcher;
    
    override public function setUp():void {
      stringContains = containsString(EXCERPT);
    }
    
    public function testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring():void {
        assertTrue("should be true if excerpt at beginning",
                stringContains.matches(EXCERPT + "END"));
        assertTrue("should be true if excerpt at end",
                stringContains.matches("START" + EXCERPT));
        assertTrue("should be true if excerpt in middle",
                stringContains.matches("START" + EXCERPT + "END"));
        assertTrue("should be true if excerpt is repeated",
                stringContains.matches(EXCERPT + EXCERPT));

        assertFalse("should not be true if excerpt is not in string",
                stringContains.matches("Something else"));
        assertFalse("should not be true if part of excerpt is in string",
                stringContains.matches(EXCERPT.substring(1)));
    }

    public function testEvaluatesToTrueIfArgumentIsEqualToSubstring():void {
        assertTrue("should be true if excerpt is entire string",
                stringContains.matches(EXCERPT));
    }

    public function testHasAReadableDescription():void {
        assertDescription("a string containing \"EXCERPT\"", stringContains);
    }
  }
}