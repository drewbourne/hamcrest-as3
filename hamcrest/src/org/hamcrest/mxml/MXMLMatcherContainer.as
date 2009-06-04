package org.hamcrest.mxml
{
    import org.hamcrest.Matcher;

    /**
     * MXMLMatcher interface for Matchers that compose zero or more MXMLMatchers.
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public interface MXMLMatcherContainer extends MXMLMatcher
    {
        /**
         * Array of MXMLMatchers to compose.
         */
        [ArrayElementType('org.hamcrest.mxml.MXMLMatcher')]
        function get matchers():Array;

        function set matchers(value:Array):void;

    }
}
