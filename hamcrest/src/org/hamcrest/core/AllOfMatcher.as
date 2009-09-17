package org.hamcrest.core
{
    import org.hamcrest.Description;
    import org.hamcrest.DiagnosingMatcher;
    import org.hamcrest.Matcher;

    /**
     * Checks if an item matches all of the given Matchers.
     *
     * @see org.hamcrest.core#allOf()
     *
     * @author Drew Bourne
     */
    public class AllOfMatcher extends DiagnosingMatcher
    {
        private var _matchers:Array;

        /**
         * Constructor.
         *
         * @param matchers Array of Matcher instances
         */
        public function AllOfMatcher(matchers:Array)
        {
            super();

            // TODO check matchers are actually Matcher instances
            _matchers = matchers || [];
        }

        /**
         * @inheritDoc
         */
        override protected function matchesOrDescribesMismatch(item:Object, mismatchDescription:Description):Boolean
        {
            for each (var matcher:Matcher in _matchers)
            {
                if (!matcher.matches(item))
                {
                    // TODO would the error messages be better if the appendText was " but was "
                    mismatchDescription.appendDescriptionOf(matcher).appendText(" ");
                    matcher.describeMismatch(item, mismatchDescription);
                    return false;
                }
            }

            return true;
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void
        {
            description.appendList("(", " and ", ")", _matchers);
        }
    }
}
