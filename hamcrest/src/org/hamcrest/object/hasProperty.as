package org.hamcrest.object {

    import org.hamcrest.Matcher;

    /**
     * Matches if <code>item.hasOwnProperty(propertyName)</code> is <code>true</code>.
     *
     * @param propertyName Name of the property the item being matched must have.
     *
     * @see org.hamcrest.object.HasPropertyMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat({ id: 1234, data: null }, hasProperty("data"));
     * </listing>
     */
    public function hasProperty(propertyName:String):Matcher {
        return new HasPropertyMatcher(propertyName);
    }
}
