package org.hamcrest.mxml.text {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.endsWith;

    /**
     * MXML wrapper for endsWith()
     */
    public class EndsWith extends StringMXMLMatcher {

        /**
         * Constructor.
         */
        public function EndsWith() {
            super();
        }

        override protected function createMatcher():Matcher {
            return endsWith(string);
        }
    }
}
