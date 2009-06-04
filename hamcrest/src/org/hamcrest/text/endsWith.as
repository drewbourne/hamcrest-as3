package org.hamcrest.text
{
    import org.hamcrest.Matcher;

    /**
     * Matches a String if it ends with the given substring.
     *
     * @param substring String to search for
     *
     * @see org.hamcrest.text.StringEndsWithMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat("The quick brown fox", endsWith("fox"));
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function endsWith(substring:String):Matcher
    {
        return new StringEndsWithMatcher(substring);
    }
}
