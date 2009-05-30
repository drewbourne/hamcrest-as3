package org.hamcrest.mxml.object {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.hasProperty;
    import org.hamcrest.object.hasPropertyWithValue;

    /**
     * Dispatched when the <code>property</code> property is changed.
     */
    [Event(name='propertyChanged', type = 'flash.events.Event')]

    /**
     * Dispatched when the <code>value</code> property is changed.
     */
    [Event(name='valueChanged', type = 'flash.events.Event')]

    /**
     * MXML façade for hasProperty() / hasPropertyWithValue() Matchers.
     *
     * @see org.hamcrest.object.hasProperty
     * @see org.hamcrest.object.hasPropertyWithValue
     * @see org.hamcrest.object.HasPropertyMatcher
     * @see org.hamcrest.object.HasPropertyWithValueMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:hasProperty property="prop" />
     *  <hc:hasProperty property="otherProp" value="{ 123 }" />
     * </listing>
     */
    [DefaultProperty('value')]
    public class HasProperty extends BaseMXMLMatcher {

        private var _property:String;
        private var _value:Matcher;

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
            if (_property != val) {
                _property = val;
                changed('property');
            }
        }

        /**
         * Matcher for the expected value of the property
         */
        [Bindable('valueChanged')]
        public function get value():Matcher {
            return _value;
        }

        public function set value(value:Matcher):void {
            if (value != _value) {
                _value = value;
                changed('value');
            }
        }

        override protected function createMatcher():Matcher {
            return value == null
                ? hasProperty(property)
                : hasPropertyWithValue(property, value);
        }
    }
}
