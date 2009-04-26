package org.hamcrest.collection {

    import org.hamcrest.*;
    import org.hamcrest.core.not;
    import org.hamcrest.text.containsString;

    public class EveryTest extends AbstractMatcherTestCase {

        public function testIsTrueWhenEveryValueMatches():void {

            assertThat(["AaA", "BaB", "CaC"], everyItem(containsString("a")));
            assertThat(["ABA", "BbB", "CbC"], not(everyItem(containsString("b"))));
        }

        public function testIsAlwaysTrueForEmptyLists():void {

            assertThat([], everyItem(containsString("a")));
        }

        public function testDescribesItself():void {

            var every:EveryMatcher = new EveryMatcher(containsString("a"));
            assertEquals("every item is a string containing \"a\"", every.toString());

            var description:Description = new StringDescription();
            every.matchesSafely(["BbB"], description);
            assertEquals("an item was \"BbB\"", description.toString());
        }
    }
}