package org.hamcrest.mxml.core {

    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.core.not;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    /**
     * MXML facade for the not() / IsNotMatcher.
     *
     * @see org.hamcrest.core.note
     * @see org.hamcrest.core.IsNotMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:Not>
     *      <hc:EqualTo value="{ 4 }" />
     *  </hc:Not>
     * </listing>
     */
    public class Not extends BaseMXMLMatcherComposite {

        /**
         * Constructor.
         */
        public function Not() {
            super();
        }

        override protected function createMatcher():Matcher {
            return not(matcher);
        }
    }
}
