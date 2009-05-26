package org.hamcrest.mxml.object {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.notNullValue;

    /**
     * MXML wrapper for notNullValue()
     */
    public class NotNull extends BaseMXMLMatcher {

        /**
         * Constructor.
         */
        public function NotNull() {
            super();
        }

        override protected function createMatcher():Matcher {
            return notNullValue();
        }
    }
}
