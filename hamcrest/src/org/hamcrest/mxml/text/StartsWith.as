package org.hamcrest.mxml.text {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.startsWith;

    /**
     * MXML wrapper for startsWith()
     */
    public class StartsWith extends StringMXMLMatcher {

        /**
         * Constructor.
         */
        public function StartsWith() {
            super();
        }

        override protected function createMatcher():Matcher {
            return startsWith(string);
        }
    }
}
