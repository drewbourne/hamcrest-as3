package org.hamcrest.collection
{
	import org.hamcrest.Matcher;
	
	/**
	 * Executes a Matcher on each item in the array until an item is reached that returns false for the specified 
	 * matcher. You use this method to determine whether all items in an array meet a criterion, such as having 
	 * values less than a particular number.
	 * 
	 * @param arrayLike Array or Object iterable with a for-each-loop.
	 * @param elementMatcher Matcher the items must match.
	 * @return A Boolean value of <code>true</code> if all items in the array return true for the specified matcher; 
	 * 		   otherwise, <code>false</code>.
	 * 
	 * @see org.hamcrest.collection#someByMatcher()
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var items:Array = [{ value: 1 }, { value: 22 }, { value: 33 }];
	 * 	var allItemsValid:Boolean = everyByMatcher(items, hasProperties({ value: lessThan(50) }));
	 * 	if (allItemsValid) {
	 * 		// ... 
	 * 	}
	 * </listing>
	 */
	public function everyByMatcher(arrayLike:Object, elementMatcher:Matcher):Boolean
	{
		for each (var item:* in arrayLike)
		{
			if (! elementMatcher.matches(item))
			{
				return false;
			}
		}
		
		return true;
	}
}