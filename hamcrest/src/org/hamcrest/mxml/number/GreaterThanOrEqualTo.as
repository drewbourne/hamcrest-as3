package org.hamcrest.mxml.number {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.greaterThanOrEqualTo;

    /**
     * MXML facade for the greaterThanOrEqualTo() / IsGreaterThanMatcher.
     *
     * @see org.hamcrest.number.greaterThanOrEqualTo
     * @see org.hamcrest.number.IsGreatherThanMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:GreaterThanOrEqualTo value="{ 4 }" />
     * </listing>
     */
    public class GreaterThanOrEqualTo extends BaseMXMLMatcher {

        private var _value:Number;

        /**
         * Constructor.
         */
        public function GreaterThanOrEqualTo() {
            super();
        }

        /**
         * Number the target value must be greater than or equal to.
         */
        [Bindable('valueChanged')]
        public function get value():Number {
            return _value;
        }

        public function set value(value:Number):void {
            if (_value != value) {
                _value = value;
                changed('value');
            }
        }

        override protected function createMatcher():Matcher {
            return greaterThanOrEqualTo(value);
        }
    }
}