package org.hamcrest.mxml.collection
{
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
     *  &lt;hc:HasItems&gt;
     *      &lt;hc:EqualTo value="{ 3 }" /&gt;
     *      &lt;hc:EqualTo value="{ 4 }" /&gt;
     *      &lt;hc:EqualTo value="{ 5 }" /&gt;
     *  &lt;hc:HasItems&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class HasItems extends BaseMXMLMatcherContainer
    {
        /**
         * Constructor.
         */
        public function HasItems()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return hasItems.apply(null, matchers);
        }
    }
}
