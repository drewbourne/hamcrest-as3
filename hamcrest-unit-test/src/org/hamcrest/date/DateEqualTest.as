package org.hamcrest.date
{
    import org.hamcrest.AbstractMatcherTestCase;
    import org.hamcrest.StringDescription;

    public class DateEqualTest extends AbstractMatcherTestCase
    {
        [Test]
        public function compares_dates_using_millisecond_precision():void
        {
            assertMatches("equal", dateEqual(new Date(2002, 1, 1, 0, 0, 0, 1)), new Date(2002, 1, 1, 0, 0, 0, 1));
			
            assertDoesNotMatch("not equal", dateEqual(new Date(2002, 1, 1, 0, 0, 1)), new Date(2002, 1, 1, 0, 0, 2));
        }
		
        [Test]
        public function describes_the_expected_date_to_millisecond_precision():void
        {
			var expectedDate:Date = new Date(1980, 1, 1);
			
            assertDescription(
				"a date equal to " + describeDate(expectedDate),
                dateEqual(expectedDate));
        }
		
		[Test]
		public function describes_the_mismatched_date_to_millisecond_precision():void 
		{
			var expectedDate:Date = new Date(2002, 1, 1, 0, 0, 0, 1);
			var actualDate:Date = new Date(2002, 1, 1, 0, 0, 0, 2);
			
			assertMismatch(
				describeDate(actualDate) + " is not the same as " + describeDate(expectedDate), 
				dateEqual(expectedDate), actualDate); 
		}
    }
}
