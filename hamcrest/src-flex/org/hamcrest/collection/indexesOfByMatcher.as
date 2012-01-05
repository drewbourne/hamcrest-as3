package org.hamcrest.collection
{
	import org.hamcrest.Matcher;

	/**
	 * Searches for an item in an array-like object by using a Matcher and returns the index positions of all matching items.
	 * 
	 * @param arrayLike Array or Object with a 'length' property and iterable with a for-loop.   
	 * @param elementMatcher Matcher the item must match. 
	 * @param startIndex The location in the arrayLike from which to start searching for the item.
	 * @return Array of index positions of matching items.
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var items:Array = [{ value: 5 }, { value: 10 }, { id: 5 }];
	 * 	var indexes:Array = indexOfByMatcher(items, hasProperties({ value: lessThan(10) }));
	 * 	// indexes === [0, 2]
	 * </listing>
	 */
	public function indexesOfByMatcher(arrayLike:Object, elementMatcher:Matcher, startIndex:int = 0):Array
	{
		var indexes:Array = [];
		
		for (var i:int = startIndex, n:int = arrayLike.length; i < n; i++)
		{
			var item:* = arrayLike[i];
			
			if (elementMatcher.matches(item)) 
			{
				indexes[indexes.length] = i;
			}
		}
		
		return indexes;
	}
}