package org.hamcrest.mxml.text
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.startsWith;

    /**
     * MXML façade for startsWith() / StringStartsWithMatcher
     *
     * @see org.hamcrest.text#startsWith()
     * @see org.hamcrest.text.StringStartsWithMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:StringWith string="the quick brown fox" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class StartsWith extends StringMXMLMatcher
    {
        /**
         * Constructor.
         */
        public function StartsWith()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return startsWith(string);
        }
    }
}
