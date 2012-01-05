package org.hamcrest.collection
{
	import org.hamcrest.Matcher;

	/**
	 * Executes a Matcher on each item in the array and constructs a new array for all items that return false for the
	 * specified matcher. If an item returns true, it is not included in the new array.
	 * 
	 * @param arrayLike Array or Object with a 'length' property and iterable with a for-loop.   
	 * @param elementMatcher Matcher the item must not match. 
	 * @return A new array that contains all items from the original array that returned <code>false</code>.
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var items:Array = [{ value: 5 }, { value: 10 }, { value: 15 }, { value: 3 }];
	 * 	var matching:Array = rejectByMatcher(items, hasProperties({ value: greaterThan(5) }));
	 * 	// matching === [items[0], items[3]]
	 * </listing>
	 */
	public function rejectByMatcher(arrayLike:Object, elementMatcher:Matcher):Array
	{
		const mismatched:Array = [];
		
		for each (var item:* in arrayLike)
		{
			if (!elementMatcher.matches(item))
			{
				mismatched[mismatched.length] = item;
			}
		}
		
		return mismatched;
	}
}