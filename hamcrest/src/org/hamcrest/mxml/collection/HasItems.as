package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.hasItems;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    /**
     * MXML facade for the hasItems() / IsArrayContainingMatcher.
     *
     * @see org.hamcrest.collection.hasItems
     * @see org.hamcrest.collection.IsArrayContainingMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:HasItems>
     *      <hc:EqualTo value="{ 3 }" />
     *      <hc:EqualTo value="{ 4 }" />
     *      <hc:EqualTo value="{ 5 }" />
     *  </hc:HasItems>
     * </listing>
     */
    public class HasItems extends BaseMXMLMatcherContainer {

        /**
         * Constructor.
         */
        public function HasItems() {
            super();
        }

        override protected function createMatcher():Matcher {
            return hasItems.apply(null, matchers);
        }
    }
}
