package org.hamcrest.object {

    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.TypeSafeMatcher;

    /**
     * Matches if <code>item.hasOwnProperty(propertyName)</code> is <code>true</code>, and the value
     * for that property matches the given valueMatcher.
     *
     * @see org.hamcrest.object.hasProperty
     */
    public class HasPropertyWithValueMatcher extends TypeSafeMatcher {

        private var _propertyName:String;
        private var _valueMatcher:Matcher;

        /**
         * Constructor.
         *
         * @param propertyName Name of the property the item being matched must have.
         * @param valueMatcher Matcher to apply to the value of the item property
         */
        public function HasPropertyWithValueMatcher(propertyName:String, valueMatcher:Matcher) {

            super(Object);
            _propertyName = propertyName;
            _valueMatcher = valueMatcher;
        }

        /**
         * @inheritDoc
         */
        override public function matchesSafely(item:Object):Boolean {

            return item.hasOwnProperty(_propertyName)
                && _valueMatcher.matches(item[_propertyName]);
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void {

            description
                .appendText("an object with property ")
                .appendValue(_propertyName)
                .appendText(" and value ")
                .appendDescriptionOf(_valueMatcher);
        }

    }
}
