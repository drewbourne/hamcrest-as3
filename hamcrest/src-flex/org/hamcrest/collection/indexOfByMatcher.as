package org.hamcrest.collection
{
	import org.hamcrest.Matcher;

	/**
	 * Searches for an item in an array-like object by using a Matcher and returns the index position of the item.
	 * 
	 * @param arrayLike Array or Object with a 'length' property and iterable with a for-loop.   
	 * @param elementMatcher Matcher the item must match. 
	 * @param startIndex The location in the arrayLike from which to start searching for the item.
	 * @returns A zero-based index position of the item in the array. 
	 * 			If the searchElement argument is not found, the return value is <code>-1</code>.
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var items:Array = [{ value: 1 }, { value: 5 }, { value: 11 }];
	 * 	var index:int = indexOfByMatcher(items, hasProperties({ value: 5 }));
	 * 	// index === 1
	 * </listing>
	 */
	public function indexOfByMatcher(arrayLike:Object, elementMatcher:Matcher, startIndex:int = 0):int
	{
		for (var i:int = startIndex, n:int = arrayLike.length; i < n; i++)
		{
			var item:* = arrayLike[i];
			
			if (elementMatcher.matches(item)) 
			{
				return i;
			}
		}
		
		return -1;
	}
}