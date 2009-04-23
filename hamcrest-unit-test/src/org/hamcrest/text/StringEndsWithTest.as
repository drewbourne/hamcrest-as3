package org.hamcrest.text {

    import org.hamcrest.*;
    import org.hamcrest.core.*;

    public class StringEndsWithTest extends AbstractMatcherTestCase {

        private static const EXCERPT:String = "EXCERPT";
        private var stringEndsWith:Matcher;

        override public function setUp():void {
            stringEndsWith = endsWith(EXCERPT);
        }

        public function testEvaluatesToTrueIfArgumentContainsSpecifiedSubstring():void {
            assertFalse("should be false if excerpt at beginning",
                stringEndsWith.matches(EXCERPT + "END"));
            assertTrue("should be true if excerpt at end",
                stringEndsWith.matches("START" + EXCERPT));
            assertFalse("should be false if excerpt in middle",
                stringEndsWith.matches("START" + EXCERPT + "END"));
            assertTrue("should be true if excerpt is at end and repeated",
                stringEndsWith.matches(EXCERPT + EXCERPT));

            assertFalse("should be false if excerpt is not in string",
                stringEndsWith.matches("Something else"));
            assertFalse("should be false if part of excerpt is at end of string",
                stringEndsWith.matches(EXCERPT.substring(0, EXCERPT.length - 2)));
        }

        public function testEvaluatesToTrueIfArgumentIsEqualToSubstring():void {
            assertTrue("should be true if excerpt is entire string",
                stringEndsWith.matches(EXCERPT));
        }

        public function testHasAReadableDescription():void {
            assertDescription("a string ending with \"EXCERPT\"", stringEndsWith);
        }
    }
}
