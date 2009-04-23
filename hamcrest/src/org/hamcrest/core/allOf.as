package org.hamcrest.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.core.AllOfMatcher;

    /**
     * Checks if an item matches all of the given Matchers.
     *
     * @param ...rest Matcher instances
     *
     * @see org.hamcrest.core.AllOfMatcher
     * @example
     * <listing version="3.0">
     *  assertThat("good", allOf(equalTo("good"), not(equalTo("bad"))));
     * </listing>
     */
    public function allOf(... rest):Matcher {
        return new AllOfMatcher(rest);
    }
}
