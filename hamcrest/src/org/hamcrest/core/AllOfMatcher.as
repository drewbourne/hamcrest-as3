package org.hamcrest.core {

    import org.hamcrest.Description;
    import org.hamcrest.DiagnosingMatcher;
    import org.hamcrest.Matcher;

    /**
     * Checks if an item matches all of the given Matchers.
     *
     * @param ...rest Matcher instances
     *
     * @see org.hamcrest.core.allOf
     * @example
     * <listing version="3.0">
     *  assertThat("good", allOf(equalTo("good"), not(equalTo("bad"))));
     * </listing>
     */
    public class AllOfMatcher extends DiagnosingMatcher {

        private var _matchers:Array;

        /**
         * Constructor.
         *
         * @param matchers Array of Matcher instances
         */
        public function AllOfMatcher(matchers:Array) {

            super();

            // TODO check matchers are actually Matcher instances
            _matchers = matchers || [];
        }

        /**
         * @inheritDoc
         */
        override protected function matchesOrDescribesMismatch(item:Object, mismatchDescription:Description):Boolean {

            for each (var matcher:Matcher in _matchers) {
                if (!matcher.matches(item)) {
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
        override public function describeTo(description:Description):void {
            description.appendList("(", " and ", ")", _matchers);
        }
    }
}
