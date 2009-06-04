package org.hamcrest.core
{
    import org.hamcrest.Matcher;

    /**
     * Checks if the item being matched matches any of the given Matchers.
     *
     * @see org.hamcrest.core.AnyOfMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat("good", anyOf(equalTo("bad"), equalTo("good")));
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function anyOf(... rest):Matcher
    {
        return new AnyOfMatcher(rest);
    }
}
