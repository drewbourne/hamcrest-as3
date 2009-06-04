package org.hamcrest.object
{
    import org.hamcrest.Matcher;

    /**
     * Matches if <code>item.hasOwnProperty(propertyName)</code> is <code>true</code>, and the value
     * for that property matches the given valueMatcher.
     *
     * @param propertyName Name of the property the item being matched must have.
     *
     * @see org.hamcrest.object.HasPropertyValueMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat({ id: 1234, data: [1, 2, 3] }, hasPropertyValue("data", everyItem(isA(Number))));
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function hasPropertyWithValue(propertyName:String, valueMatcher:Matcher):Matcher
    {
        return new HasPropertyWithValueMatcher(propertyName, valueMatcher);
    }
}
