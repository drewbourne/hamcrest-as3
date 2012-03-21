package org.hamcrest.collection
{
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class IndexOfByMatcherTest
	{
		[Test]
		public function returns_index_of_first_matching_item():void 
		{
			const items:Array = [1, 2, 3, 2];
			const SEARCH_ITEM:int = 2;
			const EXPECTED_INDEX:int = 1;
			
			assertThat("matches 2 at index 1", indexOfByMatcher(items, equalTo(SEARCH_ITEM)), equalTo(EXPECTED_INDEX));
		}
		
		[Test]
		public function returns_index_of_first_matching_item_from_start_index():void 
		{
			const items:Array = [1, 2, 3, 2];
			const SEARCH_ITEM:int = 2;
			const START_INDEX:int = 2;
			const EXPECTED_INDEX:int = 3;
			
			assertThat("matches 2 at index 3", indexOfByMatcher(items, equalTo(SEARCH_ITEM), START_INDEX), equalTo(EXPECTED_INDEX));
		}
	}
}