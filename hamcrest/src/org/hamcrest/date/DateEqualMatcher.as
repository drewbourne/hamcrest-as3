package org.hamcrest.date
{
    import org.hamcrest.Description;
    import org.hamcrest.TypeSafeMatcher;

    /**
     * Matches a Date before the expected Date
     *
     * @see org.hamcrest.date.dateBefore
     */
    public class DateEqualMatcher extends TypeSafeMatcher
    {
        private var _compareDate:Date;

        /**
         * Constructor.
         *
         * @param value Expected Date the matched value must be exactly equal to
         */
        public function DateEqualMatcher(value:Date)
        {
            super(Date);
            _compareDate = value;
        }

        /**
         * @inheritDoc
         */
        override public function matchesSafely(value:Object):Boolean
        {
            return (value.getTime() == _compareDate.getTime());
        }

        /**
         * @inheritDoc
         */
        override public function describeMismatch(item:Object, mismatchDescription:Description):void
        {
            mismatchDescription.appendValue(item)
                .appendText(" is not the same as ");

            mismatchDescription.appendValue(_compareDate);
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void
        {
            description.appendText("a date equal to ").appendValue(_compareDate);
        }

    }
}
