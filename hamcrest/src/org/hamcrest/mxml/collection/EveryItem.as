package org.hamcrest.mxml.collection
{
    import org.hamcrest.Matcher;
    import org.hamcrest.collection.everyItem;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    /**
     * MXML facade for the everyItem() / EveryMatcher.
     *
     * @see org.hamcrest.collection#everyItem()
     * @see org.hamcrest.collection.EveryMatcher
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
    public class EveryItem extends BaseMXMLMatcherComposite
    {
        /**
         * Constructor.
         */
        public function EveryItem()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return everyItem(matcher);
        }
    }
}
