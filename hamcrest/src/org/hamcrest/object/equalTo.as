package org.hamcrest.object {

    import org.hamcrest.Matcher;

    /**
     * Checks the item being matched is equal (==) or strictly equal (===) depending on the item type.
     *
     * <ul>
     * <li><code>Number</code>s match if they are strictly equal (===) </li>
     * <li><code>Number</code>s match if they are both <code>NaN</code>. </li>
     * <li><code>null</code>s match if they are both <code>null</code> </li>
     * <li><code>Array</code>s match if they are the same length and each item is strictly equal.
     *  Checked recursively for child arrays. </li>
     * </ul>
     *
     * @example
     * <listing version="3.0">
     *  assertThat("hi", equalTo("hi"));
     *  assertThat("bye", not(equalTo("hi")));
     * </listing>
     */
    public function equalTo(value:Object):Matcher {
        return new IsEqualMatcher(value);
    }
}
