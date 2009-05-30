package org.hamcrest.mxml.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.core.anything;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML facade for the anything() / IsAnythingMatcher.
     *
     * @see org.hamcrest.core.anything
     * @see org.hamcrest.core.IsAnythingMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:Anything />
     * </listing>
     */
    public class Anything extends BaseMXMLMatcher {

        /**
         * Constructor.
         */
        public function Anything() {
            super();
        }

        override protected function createMatcher():Matcher {
            return anything();
        }
    }
}
