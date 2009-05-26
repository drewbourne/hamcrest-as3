package org.hamcrest.mxml.object {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.nullValue;

    /**
     * MXML wrapper for notNullValue()
     */
    public class Null extends BaseMXMLMatcher {

        /**
         * Constructor.
         */
        public function Null() {
            super();
        }

        override protected function createMatcher():Matcher {
            return nullValue();
        }
    }
}
