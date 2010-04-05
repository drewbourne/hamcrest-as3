package org.hamcrest.collection
{
    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.TypeSafeDiagnosingMatcher;
    
    /**
     * Checks the item being matched is an <code>Array</code> and has the expected number of items.
     *
     * @see org.hamcrest.collection#arrayWithSize()
     * @see org.hamcrest.collection#emptyArray()
     *
     * @example
     * <listing version="3.0">
     *  assertThat([true, false], arrayWithSize(2));
     * </listing>
     *
     * @author Drew Bourne
     */
    public class IsArrayWithSizeMatcher extends TypeSafeDiagnosingMatcher
    {
        private var _sizeMatcher:Matcher;
        
        /**
         * Constructor.
         *
         * @param sizeMatcher should be an instance of equalTo(n) where n is the expected size.
         */
        public function IsArrayWithSizeMatcher(sizeMatcher:Matcher)
        {
            super(Object);
            
            _sizeMatcher = sizeMatcher;
        }
        
        /**
         * @inheritDoc
         */
        override public function matchesSafely(item:Object, mismatchDescription:Description):Boolean
        {
            var array:Array = toArray(item);
            var result:Boolean = true;
            
            if (!_sizeMatcher.matches(array.length))
            {
                mismatchDescription
                    .appendText("size ")
                    .appendMismatchOf(_sizeMatcher, array.length);
                    
                result = false;
            }
            
            return result;
        }
        
        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void
        {
            description
                .appendText("an Array with size ")
                .appendDescriptionOf(_sizeMatcher);
        }
    }
}

/**
 * Converts an Array-like Object to an Array.
 * 
 * @param iterable Object
 * @returns Array
 */
internal function toArray(iterable:Object):Array 
{
    var result:Array = [];
	
	for each (var item:Object in iterable)
	{
		result[result.length] = item;
	}
	
	return result;		
}