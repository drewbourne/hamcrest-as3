package org.hamcrest.mxml.core
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.allOf;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    /**
     * MXML facade for the allOf() / AllOfMatcher.
     *
     * @see org.hamcrest.core#allOf()
     * @see org.hamcrest.core.AllOfMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:AllOf&gt;
     *      &lt;hc:NotNull /&gt;
     *      &lt;hc:Between min="{ 1 }" max="{ 5 }" /&gt;
     *      &lt;hc:CloseTo value="{ 4 }" delta="{ 0.3 }" /&gt;
     *  &lt;hc:AllOf&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class AllOf extends BaseMXMLMatcherContainer
    {
        /**
         * Constructor.
         */
        public function AllOf()
        {
            super();
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return allOf.apply(null, matchers);
        }
    }
}
