package org.hamcrest.mxml.collection
{

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    /**
     * MXML facade for the hasItem() / IsArrayContainingMatcher.
     *
     * @see org.hamcrest.collection#hasItem()
     * @see org.hamcrest.collection.IsArrayContainingMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:EveryItem&gt;
     *      &lt;hc:EqualTo value="{ 3 }" /&gt;
     *  &lt;hc:EveryItem&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class HasItem extends BaseMXMLMatcherComposite
    {
        /**
         * Constructor.
         */
        public function HasItem()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return hasItem(matcher);
        }
    }
}
