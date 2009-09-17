package org.hamcrest.mxml.text
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.containsString;
    
    /**
     * MXML façade for containsString() / StringContainsMatcher.
     *
     * @see org.hamcrest.text#containsString()
     * @see org.hamcrest.text.StringContainsMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:ContainsString string="string that should be contained" /&gt;
     *
     *  &lt;hc:ContainsString&gt;
     *      &lt;![CDATA[
     * multiline strings
     * can be matched too
     *      ]]&gt;
     *  &lt;hc:ContainsString&gt;
     * </listing>
     *
     * @author Drew Bourne
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
