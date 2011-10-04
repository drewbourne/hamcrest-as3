package org.hamcrest.date
{
    import org.hamcrest.AbstractMatcherTestCase;

    public class DateBetweenTest extends AbstractMatcherTestCase
    {
        [Test]
        public function betweenInclusive():void
        {
            assertMatches("inside range",
                dateBetween(new Date(1900, 1, 1), new Date(2000, 1, 1)), new Date(2000, 1, 1));
			
            assertDoesNotMatch("outside range",
                dateBetween(new Date(1900, 1, 1), new Date(2000, 1, 1)), new Date(2100, 1, 1));
        }

        [Test]
        public function betweenExclusive():void
        {
			var min:Date = new Date(1900, 1, 1);
			var max:Date = new Date(2000, 1, 1);
			var value:Date = new Date(1990, 1, 1);
			var mismatchedValue:Date = new Date(2000, 1, 1);
			
            assertMatches("inside range",
                dateBetween(min, max, true), value);
			
            assertDoesNotMatch("outside range",
                dateBetween(min, max, true), mismatchedValue);
        }

        [Test]
        public function hasAReadableDescription():void
        {
			var min:Date = new Date(1900, 0, 1);
			var max:Date = new Date(2000, 0, 1);
			
            assertDescription("a date between " + describeDate(min) + " and " + describeDate(max),
                dateBetween(min, max));
			
            assertDescription("a date between " + describeDate(min) + " and " + describeDate(max)  + " exclusive",
                dateBetween(min, max, true));
        }
    }
}
