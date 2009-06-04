package org.hamcrest.mxml.number
{
    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.closeTo;

    /**
     * MXML facade for the closeTo() / IsCloseToMatcher
     *
     * @see org.hamcrest.number.closeTo
     * @see org.hamcrest.number.IsCloseToMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:CloseTo value="{ 3 }" delta="{ 0.5 }" />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class CloseTo extends BaseMXMLMatcher
    {

        private var _value:Number;
        private var _delta:Number;

        /**
         * Constructor.
         */
        public function CloseTo()
        {
            super();
        }

        /**
         * Number the target value must be close to.
         */
        [Bindable('valueChanged')]
        public function get value():Number
        {
            return _value;
        }

        public function set value(value:Number):void
        {
            if (_value != value)
            {
                _value = value;
                changed('value');
            }
        }

        /**
         * Amount of error to include when checking the target value.
         */
        [Bindable('deltaChanged')]
        public function get delta():Number
        {
            return _delta;
        }

        public function set delta(val:Number):void
        {
            if (_delta != val)
            {
                _delta = val;
                changed('delta');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return closeTo(value, delta);
        }
    }
}