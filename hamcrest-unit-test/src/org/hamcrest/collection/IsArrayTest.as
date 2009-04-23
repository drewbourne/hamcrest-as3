package org.hamcrest.collection {

    import org.hamcrest.AbstractMatcherTestCase;
    import org.hamcrest.object.equalTo;

    public class IsArrayTest extends AbstractMatcherTestCase {

        public function testMatchesAnArrayThatMatchesAllTheElementMatchers():void {
            assertMatches("should match array with matching elements",
                array(equalTo("a"), equalTo("b"), equalTo("c")), ["a", "b", "c"]);
        }

        public function testDoesNotMatchAnArrayWhenElementDoNotMatch():void {
            assertDoesNotMatch("should not match array with different elements",
                array(equalTo("a"), equalTo("b")), ["b", "c"]);
        }

        public function testDoesNotMatchAnArrayOfDifferentSize():void {
            assertDoesNotMatch("should not match larger array",
                array(equalTo("a"), equalTo("b")), ["a", "b", "c"]);
            assertDoesNotMatch("should not match smaller array",
                array(equalTo("a"), equalTo("b")), ["a"]);
        }

        public function testDoesNotMatchNull():void {
            assertDoesNotMatch("should not match null",
                array(equalTo("a")), null);
        }

        public function testConvertsLiteralValuesToEqualToMatcher():void {
            assertMatches("should convert items and match array with matching elements",
                array("a", "b", "c"), ["a", "b", "c"]);
        }

        public function testHasAReadableDescription():void {
            assertDescription("[\"a\", \"b\"]", array(equalTo("a"), equalTo("b")));
        }
    }
}
