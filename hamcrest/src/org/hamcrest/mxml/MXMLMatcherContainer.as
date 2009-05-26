package org.hamcrest.mxml {

    import org.hamcrest.Matcher;

    public interface MXMLMatcherContainer extends MXMLMatcher {

        function get matchers():Array;

        function set matchers(value:Array):void;

    }
}
