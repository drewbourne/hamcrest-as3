package org.hamcrest.text {

    /**
     * Matches a String if it ends with the given value
     *
     * @see org.hamcrest.text.endsWith
     * @see org.hamcrest.text.SubstringMatcher
     */
    public class StringEndsWithMatcher extends SubstringMatcher {

        /**
         * Constructor
         *
         * @param substring String to search for
         */
        public function StringEndsWithMatcher(substring:String) {
            super(substring);
        }

        /**
         * @inheritDoc
         */
        override protected function evaluateSubstringOf(s:String):Boolean {
            return (new RegExp(substring + '$')).test(s);
        }

        /**
         * @inheritDoc
         */
        override protected function relationship():String {
            return "ending with";
        }
    }
}
