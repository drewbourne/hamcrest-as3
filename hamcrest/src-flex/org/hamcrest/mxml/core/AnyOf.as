package org.hamcrest.mxml.core
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.anyOf;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    /**
     * MXML facade for the anyOf() / AnyOfMatcher.
     *
     * @see org.hamcrest.core#anyOf()
     * @see org.hamcrest.core.AnyOfMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:AnyOf&gt;
     *      &lt;hc:EqualTo value="{ 3 }" /&gt;
     *      &lt;hc:EqualTo value="{ 4 }" /&gt;
     *      &lt;hc:EqualTo value="{ 5 }" /&gt;
     *  &lt;hc:AnyOf&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class AnyOf extends BaseMXMLMatcherContainer
    {
        /**
         * Constructor.
         */
        public function AnyOf()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return anyOf.apply(null, matchers);
        }
    }
}
