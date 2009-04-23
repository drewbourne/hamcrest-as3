package org.hamcrest.number {

    import org.hamcrest.AbstractMatcherTestCase;

    public class GreaterThanTest extends AbstractMatcherTestCase {

        public function testGreaterThan():void {
            assertMatches("greater than", greaterThan(10), 11);
            assertDoesNotMatch("not greater than", greaterThan(10), 10);
        }

        public function testGreaterThanOrEqualTo():void {
            assertMatches("greater than", greaterThanOrEqualTo(10), 10);
            assertDoesNotMatch("not greater than", greaterThanOrEqualTo(10), 9);
        }

        public function testHasAReadableDescription():void {
            assertDescription("a value greater than <3>", greaterThan(3));
            assertDescription("a value greater than or equal to <3>", greaterThanOrEqualTo(3));
        }
    }
}
