package org.hamcrest.text
{

    /**
     * Matches a String if it contains the given substring.
     *
     * @see org.hamcrest.text.containsString
     * @see org.hamcrest.text.SubstringMatcher
     *
     * @author Drew Bourne
     */
    public class StringContainsMatcher extends SubstringMatcher
    {
        /**
         * Constructor
         *
         * @param substring Substring to search for
         */
        public function StringContainsMatcher(substring:String)
        {
            super(substring);
        }

        /**
         * @inheritDoc
         */
        override protected function evaluateSubstringOf(s:String):Boolean
        {
            return s.indexOf(substring) >= 0;
        }

        /**
         * @inheritDoc
         */
        override protected function relationship():String
        {
            return "containing";
        }
    }
}
