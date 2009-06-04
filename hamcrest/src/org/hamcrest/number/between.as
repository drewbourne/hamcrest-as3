package org.hamcrest.number
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.allOf;
    import org.hamcrest.core.describedAs;

    /**
     * Matches if the values is between the min and max values.
     *
     * @param min Minimum value
     * @param max Maximum value
     * @param inclusive
     *    <code>true</code> to allow the value to be equal to the min or max,
     *    <code>false</code> to require the value to be inside the range of the min and max.
     * @return Matcher
     *
     * @example
     * <listing version="3.0">
     * assertThat(2, between(2, 4));
     * // passes
     *
     * assertThat(2, between(2, 4, true));
     * // fails
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function between(min:Number, max:Number, exclusive:Boolean = false):Matcher
    {
        if (min > max)
        {
            throw new ArgumentError("min value cannot be greater than the max value");
        }

        if (max < min)
        {
            throw new ArgumentError("max value cannot be less than the min value");
        }

        var matcher:Matcher = !exclusive
            ? allOf(lessThanOrEqualTo(max), greaterThanOrEqualTo(min))
            : allOf(lessThan(max), greaterThan(min));

        var description:String = "a Number between %0 and %1";
        if (exclusive)
        {
            description += " exclusive";
        }

        return describedAs(description, matcher, min, max);
    }
}
