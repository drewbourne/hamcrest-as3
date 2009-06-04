package org.hamcrest.mxml.core
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.allOf;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    /**
     * MXML facade for the allOf() / AllOfMatcher.
     *
     * @see org.hamcrest.core.allOf
     * @see org.hamcrest.core.AllOfMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:AllOf>
     *      <hc:NotNull />
     *      <hc:Between min="{ 1 }" max="{ 5 }" />
     *      <hc:CloseTo value="{ 4 }" delta="{ 0.3 }" />
     *  </hc:AllOf>
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
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
