package org.hamcrest.object {

    import org.hamcrest.AbstractMatcherTestCase;

    public class HasPropertyTest extends AbstractMatcherTestCase {

        [Test]
        public function evaluatesToTrueIfArgumentHasOwnProperty():void {

            assertMatches("has property", hasProperty("value"), { value: "one" });
            assertDoesNotMatch("does not have property", hasProperty("value"), { other: true });
        }

        [Test]
        public function hasAReadableDescription():void {

            assertDescription('an object with property "value"', hasProperty("value"));
        }

    }
}
