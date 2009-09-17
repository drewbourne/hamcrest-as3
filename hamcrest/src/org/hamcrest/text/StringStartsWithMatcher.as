package org.hamcrest.text
{

    /**
     * Matches a String if it starts with the given value
     *
     * @see org.hamcrest.text#endsWith()
     * @see org.hamcrest.text.SubstringMatcher
     *
     * @author Drew Bourne
     */
    public class StringStartsWithMatcher extends SubstringMatcher
    {
        /**
         * Constructor
         *
         * @param substring String to search for
         */
        public function StringStartsWithMatcher(substring:String)
        {
            super(substring);
        }

        /**
         * @inheritDoc
         */
        override protected function evaluateSubstringOf(s:String):Boolean
        {
            return (new RegExp('^' + substring)).test(s);
        }

        /**
         * @inheritDoc
         */
        override protected function relationship():String
        {
            return "starting with";
        }
    }
}
