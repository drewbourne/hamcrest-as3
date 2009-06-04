package org.hamcrest.mxml.text
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.endsWith;

    /**
     * MXML façade for endsWith() / StringEndsWithMatcher
     *
     * @see org.hamcrest.text.endsWith
     * @see org.hamcrest.text.StringEndsWithMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:EndsWith string="lazy dog" />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class EndsWith extends StringMXMLMatcher
    {
        /**
         * Constructor.
         */
        public function EndsWith()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return endsWith(string);
        }
    }
}
