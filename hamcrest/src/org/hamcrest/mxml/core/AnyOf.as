package org.hamcrest.mxml.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.core.anyOf;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    /**
     * MXML facade for the anyOf() / AnyOfMatcher.
     *
     * @see org.hamcrest.core.anyOf
     * @see org.hamcrest.core.AnyOfMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:AnyOf>
     *      <hc:EqualTo value="{ 3 }" />
     *      <hc:EqualTo value="{ 4 }" />
     *      <hc:EqualTo value="{ 5 }" />
     *  </hc:AnyOf>
     * </listing>
     */
    public class AnyOf extends BaseMXMLMatcherContainer {

        /**
         * Constructor.
         */
        public function AnyOf() {
            super();
        }

        override protected function createMatcher():Matcher {
            return anyOf.apply(null, matchers);
        }
    }
}
