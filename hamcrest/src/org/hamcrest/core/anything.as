package org.hamcrest.core
{
    import org.hamcrest.Matcher;

    /**
     * Checks if item being matched is anything, effectively always matches.
     *
     * @param message Custom message to use in <code>describeTo</code>
     *
     * @see org.hamcrest.core.IsAnythingMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat("the great void", anything());
     * </listing>
     *
     * @author Drew Bourne
     */
    public function anything(message:String = null):Matcher
    {
        return new IsAnythingMatcher(message);
    }
}
