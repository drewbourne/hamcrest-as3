package org.hamcrest.number
{
	
	import org.hamcrest.AbstractMatcherTestCase;
	
	public class AtLeastTest extends AbstractMatcherTestCase
	{
		[Test]
		public function comparesValuesUsingAtLeast():void
		{
			assertMatches("greater than", atLeast(10), 10);
			assertDoesNotMatch("not greater than", atLeast(10), 9);
		}
		
		[Test]
		public function hasAReadableDescription():void
		{
			assertDescription("at least <3>", atLeast(3));
		}
		
		[Test]
		public function hasMismatchDescription():void
		{
			assertMismatch("was <2>", atLeast(3), 2);
		}
	}
}
