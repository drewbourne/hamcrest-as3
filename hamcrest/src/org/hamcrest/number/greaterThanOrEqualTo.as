package org.hamcrest.number
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.anyOf;
    import org.hamcrest.core.describedAs;
    import org.hamcrest.object.equalTo;

    /**
     * Matches if the item is greater than or equal to the given value.
     *
     * @param value Number the matched item must be greater than or equal to.
     * @return Matcher
     *
     * @example
     * <listing version="3.0">
     * assertThat(4, greaterThanOrEqualTo(4));
     * </listing>
     *
     * @author Drew Bourne
     */
    public function greaterThanOrEqualTo(value:Number):Matcher
    {
        // composition is a winner
        // TODO create an actual Matcher so we can include an appropriate mismatch description
        return describedAs("a value greater than or equal to %0", anyOf(greaterThan(value), equalTo(value)), value);
    }
}
