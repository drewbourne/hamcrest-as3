package org.hamcrest.mxml.object {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.hasProperty;
    import org.hamcrest.object.hasPropertyWithValue;

    /**
     * MXML wrapper for hasProperty() / hasPropertyWithValue() Matchers
     */
    public class HasProperty extends BaseMXMLMatcher {

        private var _property:String;
        private var _value:*;

        /**
         * Constructor.
         */
        public function HasProperty() {
            super();
        }

        /**
         * Property name target object must have.
         */
        [Bindable('propertyChanged')]
        public function get property():* {
            return _property;
        }

        public function set property(val:*):void {
            if (val == _property) {
                return;
            }

            _property = val;
            changed('property');
        }

        /**
         * Expected Value of the property
         */
        [Bindable('valueChanged')]
        public function get value():* {
            return _value;
        }

        public function set value(value:*):void {
            if (value == _value) {
                return;
            }

            _value = value;
            changed('value');
        }

        override protected function createMatcher():Matcher {
            return value === undefined
                ? hasProperty(property)
                : hasPropertyWithValue(property, value);
        }
    }
}
