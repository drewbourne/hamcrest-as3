package org.hamcrest.text {

    import org.hamcrest.Matcher;

    /**
     * Matches a String if it contains the given substring.
     *
     * @param substring String to search for
     *
     * @see org.hamcrest.text.StringContainsMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat("The quick brown fox", containsString("fox"));
     * </listing>
     */
    public function containsString(substring:String):Matcher {
        return new StringContainsMatcher(substring);
    }
}
