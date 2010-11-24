package org.hamcrest.mxml.collection
{

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.emptyArray;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML facade for the emptyArray() / IsArrayWithSizeMatcher.
     *
     * @see org.hamcrest.collection#emptyArray()
     * @see org.hamcrest.collection.IsArrayWithSizeMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:EmptyArray /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class EmptyArray extends BaseMXMLMatcher
    {
        private var _size:int;

        /**
         * Constructor.
         */
        public function EmptyArray()
        {
            super();
            invalidateProperties();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return emptyArray();
        }
    }
}
