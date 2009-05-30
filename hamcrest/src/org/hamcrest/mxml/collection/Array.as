package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.array;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    /**
     * MXML facade for the array() / IsArrayMatcher.
     *
     * @see org.hamcrest.collection.array;
     * @see org.hamcrest.collection.IsArrayMatcher;
     *
     * @example
     * <listing version="3.0">
     *  <hc:Array>
     *      <hc:EqualTo value="{ 1 }" />
     *      <hc:EqualTo value="{ 2 }" />
     *      <hc:EqualTo value="{ 3 }" />
     *  </hc:Array>
     * </listing>
     */
    public class Array extends BaseMXMLMatcherContainer {

        /**
         * Constructor.
         */
        public function Array() {
            super();
        }

        override protected function createMatcher():Matcher {
            return array.apply(null, matchers || []);
        }
    }
}
