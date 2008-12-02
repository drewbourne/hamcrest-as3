package org.hamcrest.text {
  
  import org.hamcrest.*;
  import org.hamcrest.core.*;
  
  public class StringStartsWithTest extends AbstractMatcherTestCase {
    
    private static const EXCERPT:String = "EXCERPT";
    private var stringStartsWith:Matcher;
    
    override public function setUp():void {
      stringStartsWith = startsWith(EXCERPT);
    }
    
    public function testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring():void {
        assertTrue("should be true if excerpt at beginning",
                stringStartsWith.matches(EXCERPT + "END"));
        assertFalse("should be false if excerpt at end",
                stringStartsWith.matches("START" + EXCERPT));
        assertFalse("should be false if excerpt in middle",
                stringStartsWith.matches("START" + EXCERPT + "END"));
        assertTrue("should be true if excerpt is at beginning and repeated",
                stringStartsWith.matches(EXCERPT + EXCERPT));

        assertFalse("should be false if excerpt is not in string",
                stringStartsWith.matches("Something else"));
        assertFalse("should be false if part of excerpt is at start of string",
                stringStartsWith.matches(EXCERPT.substring(1)));
    }

    public function testEvaluatesToTrueIfArgumentIsEqualToSubstring():void {
        assertTrue("should be true if excerpt is entire string",
                stringStartsWith.matches(EXCERPT));
    }

    public function testHasAReadableDescription():void {
        assertDescription("a string starting with \"EXCERPT\"", stringStartsWith);
    }
  }
}