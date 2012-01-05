package org.hamcrest.collection
{
	import org.flexunit.assertThat;
	import org.hamcrest.core.anything;
	import org.hamcrest.core.nothing;
	import org.hamcrest.number.greaterThan;
	
	public class RejectByMatcherTest
	{
		[Test]
		public function returns_mismatched_items():void 
		{
			const items:Array = [1, 2, 3, 4, 5];
			
			assertThat(rejectByMatcher(items, greaterThan(2)), array(1, 2));
		}
		
		[Test]
		public function returns_empty_array_if_every_item_matches():void 
		{
			const items:Array = [1, 2, 3, 4, 5];
			
			assertThat(rejectByMatcher(items, anything()), emptyArray());
		}
	}
}