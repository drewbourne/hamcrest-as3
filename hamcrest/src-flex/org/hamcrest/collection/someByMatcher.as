package org.hamcrest.collection
{
	import org.hamcrest.Matcher;

	/**
	 * Executes a Matcher on each item in the array until an item is reached that returns true. Use this method to 
	 * determine whether any items in an array meet a criterion, such as having a value less than a particular number.
	 * 
	 * @param arrayLike Array or Object iterable with a for-each-loop.
	 * @param elementMatcher Matcher an item must match.
	 * @return A Boolean value of true if any items in the array return <code>true</code> for the Matcher; 
	 * 		   otherwise <code>false</code>.
	 * 
	 * @see org.hamcrest.collection#everyByMatcher()
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var items:Array = [{ value: 100 }, { value: 50 }, { value: 20 }];
	 * 	var anyItemValid:Boolean = someByMatcher(items, hasProperties({ value: lessThan(50) }));
	 * 	if (anyItemValid) {
	 * 		// ...
	 * 	}
	 * </listing>
	 */
	public function someByMatcher(arrayLike:Object, elementMatcher:Matcher):Boolean
	{
		for each (var item:* in arrayLike)
		{
			if (elementMatcher.matches(item))
			{
				return true;
			}
		}
		
		return false;
	}
}