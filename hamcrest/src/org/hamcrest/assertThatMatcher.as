package org.hamcrest
{
    /**
     * Used internally by <code>assertThat</code>.
     *
     * @param reason Description of failure should <code>actual</code> not match <code>matcher</code>
     * @param actual Object to match
     * @param matcher Matcher to match <code>actual</code> with.
     *
     * @author Drew Bourne
     */
    internal function assertThatMatcher(reason:String, actual:Object, matcher:Matcher):void
    {
        if (!matcher.matches(actual))
        {
            var description:Description = new StringDescription();

            if (reason && reason.length > 0)
            {
                description.appendText(reason).appendText("\n");
            }

            description.appendText("Expected: ")
                .appendDescriptionOf(matcher)
                .appendText("\n     but: ")

            matcher.describeMismatch(actual, description);

            throw new AssertionError(description.toString());
        }
    }
}
