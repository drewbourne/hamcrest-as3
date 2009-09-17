package org.hamcrest.mxml.collection
{
    import org.hamcrest.Matcher;
    import org.hamcrest.collection.array;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    /**
     * MXML facade for the array() / IsArrayMatcher.
     *
     * @see org.hamcrest.collection#array()
     * @see org.hamcrest.collection.IsArrayMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:Array&gt;
     *      &lt;hc:EqualTo value="{ 1 }" /&gt;
     *      &lt;hc:EqualTo value="{ 2 }" /&gt;
     *      &lt;hc:EqualTo value="{ 3 }" /&gt;
     *  &lt;hc:Array&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class Array extends BaseMXMLMatcherContainer
    {
        /**
         * Constructor.
         */
        public function Array()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return array.apply(null, matchers || []);
        }
    }
}
