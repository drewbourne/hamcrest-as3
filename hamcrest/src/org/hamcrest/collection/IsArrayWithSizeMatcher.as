package org.hamcrest.collection {

    import org.hamcrest.TypeSafeMatcher;
    import org.hamcrest.Description;
    import org.hamcrest.Matcher;

    /**
     * Checks the item being matched is an <code>Array</code> and has the expected number of items.
     *
     * @see org.hamcrest.collection.arrayWithSize
     * @see org.hamcrest.collection.emptyArray
     * @example
     * <listing version="3.0">
     *  assertThat([true, false], arrayWithSize(2));
     * </listing>
     */
    public class IsArrayWithSizeMatcher extends TypeSafeMatcher {

        private var _sizeMatcher:Matcher;

        /**
         * Constructor.
         *
         * @param sizeMatcher should be an instance of equalTo(n) where n is the expected size.
         */
        public function IsArrayWithSizeMatcher(sizeMatcher:Matcher) {
            super(Array);
            _sizeMatcher = sizeMatcher;
        }

        /**
         * @inheritDoc
         */
        override public function matchesSafely(item:Object):Boolean {
            return _sizeMatcher.matches((item as Array).length);
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void {
            description.appendText("an Array with size ")
                .appendDescriptionOf(_sizeMatcher);
        }
    }
}
