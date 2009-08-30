package org.hamcrest.number
{
    import org.hamcrest.Description;
    import org.hamcrest.TypeSafeMatcher;

    /**
     * Matches if the item is greater than the given value.
     *
     * @example
     * <listing version="3.0">
     * assertThat(5, greaterThan(4));
     * </listing>
     *
     * @author Drew Bourne
     */
    public class IsGreaterThanMatcher extends TypeSafeMatcher
    {
        private var _value:Number;

        /**
         * Constructor.
         */
        public function IsGreaterThanMatcher(value:Number)
        {
            super(Number);
            _value = value;
        }

        override public function matchesSafely(item:Object):Boolean
        {
            return Number(item) > _value;
        }

        override public function describeMismatch(item:Object, mismatchDescription:Description):void
        {
            mismatchDescription.appendValue(item)
                .appendText(" was less than ");

            mismatchDescription.appendValue(_value);
        }

        override public function describeTo(description:Description):void
        {
            description.appendText("a value greater than ");
            description.appendValue(_value);
        }
    }
}
