package org.hamcrest.core
{
	import org.hamcrest.*;
	
	public class IsNothingTest extends AbstractMatcherTestCase
	{
		[Test]
		public function always_evaluates_to_false():void
		{
			assertDoesNotMatch("null", nothing(), null);
			assertDoesNotMatch("Object", nothing(), {});
			assertDoesNotMatch("Number", nothing(), 123);
			assertDoesNotMatch("Boolean", nothing(), true);
			assertDoesNotMatch("String", nothing(), "string");
		}
		
		[Test]
		public function has_default_description():void
		{
			assertDescription("NOTHING", nothing());
		}
		
		[Test]
		public function has_overrideable_description():void
		{
			var description:String = "description";
			assertDescription(description, nothing(description));
		}
	}
}
