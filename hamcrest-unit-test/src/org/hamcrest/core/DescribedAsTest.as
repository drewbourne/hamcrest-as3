package org.hamcrest.core {

    import org.hamcrest.*;

    public class DescribedAsTest extends AbstractMatcherTestCase {

        public function testOverridesDescriptionOfOtherMatcherWithThatPassedToConstructor():void {

            var m1:Matcher = describedAs("m1 description", anything());
            var m2:Matcher = describedAs("m2 description", not(anything()));

            assertDescription("m1 description", m1);
            assertDescription("m2 description", m2);
        }

        public function testAppendsValuesToDescription():void {

            var matcher:Matcher = describedAs("value 1 = %0, value 2 = %1", anything(), 33, 97);

            assertDescription("value 1 = <33>, value 2 = <97>", matcher);
        }

        public function testDelegatesMatchingToAnotherMatcher():void {

            var m1:Matcher = describedAs("irrelevant", anything());
            var m2:Matcher = describedAs("irrelevant", not(anything()));

            assertTrue(m1.matches(new Object()));
            assertFalse(m2.matches("hi"));
        }
    }
}