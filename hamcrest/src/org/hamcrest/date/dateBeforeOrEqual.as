package org.hamcrest.date
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.describedAs;

    /**
     * Matches if the date item is before the given date.
     *
     * @param value Date the matched number must be before.
     * @return Matcher
     *
     * @example
     * <listing version="3.0">
     * assertThat( new Date(1920, 1, 1), dateBefore( new Date() ) );
     * </listing>
     */
    public function dateBeforeOrEqual(value:Date):Matcher
    {
        var beforeMatcher:DateBeforeMatcher = new DateBeforeMatcher(value, true);
        return describedAs("a date before or equal to %0", beforeMatcher, value);
    }
}
