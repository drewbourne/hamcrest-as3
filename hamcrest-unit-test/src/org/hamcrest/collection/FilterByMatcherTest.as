package org.hamcrest.collection
{
	import org.flexunit.assertThat;
	import org.hamcrest.core.nothing;
	import org.hamcrest.number.greaterThan;

	public class FilterByMatcherTest
	{
		[Test]
		public function returns_matching_items():void 
		{
			const items:Array = [1, 2, 3, 4, 5];
			
			assertThat(filterByMatcher(items, greaterThan(2)), array(3, 4, 5));
		}
		
		[Test]
		public function returns_empty_array_for_no_matching_items():void 
		{
			const items:Array = [1, 2, 3, 4, 5];
			
			assertThat(filterByMatcher(items, nothing()), emptyArray());
		}
	}
}