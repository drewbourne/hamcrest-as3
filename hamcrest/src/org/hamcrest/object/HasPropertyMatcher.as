package org.hamcrest.object {

    import org.hamcrest.Description;
    import org.hamcrest.TypeSafeMatcher;

    /**
     * Matches if <code>item.hasOwnProperty(propertyName)</code> is <code>true</code>.
     *
     * @see org.hamcrest.object.hasProperty
     */
    public class HasPropertyMatcher extends TypeSafeMatcher {

        private var _propertyName:String;

        /**
         * Constructor.
         *
         * @param propertyName Name of the property the item being matched must have.
         */
        public function HasPropertyMatcher(propertyName:String) {

            super(Object);
            _propertyName = propertyName;
        }

        /**
         * @inheritDoc
         */
        override public function matchesSafely(item:Object):Boolean {

            return item.hasOwnProperty(_propertyName);
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void {

            description.appendText("an object with property ").appendValue(_propertyName);
        }

    }
}
