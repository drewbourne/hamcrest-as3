package org.hamcrest.text
{

    import org.hamcrest.Matcher;

    /**
     * Matches a String if it starts with the given substring.
     *
     * @param substring String to search for
     *
     * @see org.hamcrest.text.StringStartsWithMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat("The quick brown fox", startsWith("The"));
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function startsWith(substring:String):Matcher
    {
        return new StringStartsWithMatcher(substring);
    }
}
