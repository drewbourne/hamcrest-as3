package org.hamcrest.mxml.number {

    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.closeTo;

    public class CloseTo extends BaseMXMLMatcher {

        private var _value:Number;
        private var _delta:Number;

        public function CloseTo() {
            super();
        }

        [Bindable('valueChanged')]
        public function get value():Number {
            return _value;
        }

        public function set value(value:Number):void {
            if (_value == value) {
                return;
            }

            _value = value;
            changed('value');
        }

        [Bindable('deltaChanged')]
        public function get delta():Number {
            return _delta;
        }

        public function set delta(val:Number):void {
            if (_delta == val) {
                return;
            }

            _delta = val;
            changed('delta');
        }

        override protected function createMatcher():Matcher {
            return closeTo(value, delta);
        }
    }
}