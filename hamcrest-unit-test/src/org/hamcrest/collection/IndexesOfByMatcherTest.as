package org.hamcrest.collection
{
	import org.flexunit.assertThat;
	import org.hamcrest.number.greaterThan;

	public class IndexesOfByMatcherTest
	{
		[Test]
		public function returns_the_index_of_all_matching_items():void 
		{
			const items:Array = [1, 2, 3, 2, 4];
			
			assertThat(indexesOfByMatcher(items, greaterThan(2)), array(2, 4));
		}
	}
}