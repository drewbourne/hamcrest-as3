package org.hamcrest.collection
{
	import org.flexunit.assertThat;
	import org.hamcrest.number.isNumber;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;

	public class SomeByMatcherTest
	{
		[Test]
		public function with_any_matching_items_returns_true():void 
		{
			var items:Array = [false, 1, false, {}];
			
			assertThat(someByMatcher(items, isNumber()), isTrue());
		}
		
		[Test]
		public function with_no_matching_items_returns_false():void 
		{
			var items:Array = [false, "1", false, {}];
			
			assertThat(someByMatcher(items, isNumber()), isFalse());	
		}
	}
}