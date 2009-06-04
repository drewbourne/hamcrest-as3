package org.hamcrest.number
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.anyOf;
    import org.hamcrest.core.describedAs;
    import org.hamcrest.object.equalTo;

    /**
     * Matches if the item is less than or equal to the given value.
     *
     * @param value Number the matched item must be less than or equal to.
     * @return Matcher
     *
     * @example
     * <listing version="3.0">
     * assertThat(4, lessThanOrEqualTo(4));
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function lessThanOrEqualTo(value:Number):Matcher
    {
        // composition is a winner
        return describedAs("a value less than or equal to %0", anyOf(lessThan(value), equalTo(value)), value);
    }
}