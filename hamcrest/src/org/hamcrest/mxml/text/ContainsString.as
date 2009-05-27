package org.hamcrest.mxml.text {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.containsString;

    /**
     * MXML wrapper for containsString()
     */
    public class ContainsString extends StringMXMLMatcher {

        /**
         * Constructor.
         */
        public function ContainsString() {
            super();
        }

        override protected function createMatcher():Matcher {
            return containsString(string);
        }
    }
}
