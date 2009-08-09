package org.hamcrest.mxml.text
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.containsString;
    
    /**
     * MXML façade for containsString() / StringContainsMatcher.
     *
     * @see org.hamcrest.text.containsString
     * @see org.hamcrest.text.StringContainsMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:ContainsString string="string that should be contained" />
     *
     *  <hc:ContainsString>
     *      <![CDATA[
     * multiline strings
     * can be matched too
     *      ]]>
     *  </hc:ContainsString>
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class ContainsString extends StringMXMLMatcher
    {
        /**
         * Constructor.
         */
        public function ContainsString()
        {
            super();
        }
        
        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return containsString(string);
        }
    }
}
