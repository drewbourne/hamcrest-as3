package org.hamcrest.mxml.number {

    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.between;

    /**
     * MXML facade for the between() Matcher
     *
     * @see org.hamcrest.number.between
     * @see org.hamcrest.number.IsLessThanMatcher
     * @see org.hamcrest.number.IsGreaterThanMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:Between min="{ 3 }" max="{ 5 }" />
     * </listing>
     */
    public class Between extends BaseMXMLMatcher {

        private var _minimum:Number;
        private var _maximum:Number;

        /**
         * Constructor.
         */
        public function Between() {
            super();
        }

        /**
         * Number the target value must be after.
         */
        [Bindable('minChanged')]
        public function get min():Number {
            return _minimum;
        }

        public function set min(value:Number):void {
            if (_minimum != value) {
                _minimum = value;
                changed('min');
            }
        }

        /**
         * Number the target value must be after.
         */
        [Bindable('maxChanged')]
        public function get max():Number {
            return _maximum;
        }

        public function set max(value:Number):void {
            if (_maximum != value) {
                _maximum = value;
                changed('max');
            }
        }

        override protected function createMatcher():Matcher {
            return between(min, max);
        }
    }
}