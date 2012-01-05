package org.hamcrest.collection
{
	import org.flexunit.assertThat;
	import org.hamcrest.number.isNumber;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;

	public class EveryByMatcherTest
	{
		[Test]
		public function with_all_matching_items_returns_true():void 
		{
			var items:Array = [1, 2, 3, 4, 5];
			
			assertThat(everyByMatcher(items, isNumber()), isTrue());
		}
		
		[Test]
		public function with_any_mismatched_item_returns_false():void 
		{
			var items:Array = [1, 2, false, 4, 5];
			
			assertThat(everyByMatcher(items, isNumber()), isFalse());	
		}
	}
}
