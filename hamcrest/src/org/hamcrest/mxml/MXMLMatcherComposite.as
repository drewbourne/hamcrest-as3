package org.hamcrest.mxml {

    public interface MXMLMatcherComposite extends MXMLMatcher {

        function get matcher():MXMLMatcher;

        function set matcher(value:MXMLMatcher):void;
    }
}
