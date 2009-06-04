package org.hamcrest.mxml
{

    /**
     * MXMLMatcher interface for Matchers that compose another MXMLMatcher.
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public interface MXMLMatcherComposite extends MXMLMatcher
    {
        /**
         * MXMLMatcher to compose.
         */
        function get matcher():MXMLMatcher;

        function set matcher(value:MXMLMatcher):void;
    }
}
