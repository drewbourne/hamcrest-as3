package org.hamcrest.mxml.number {

    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.between;

    public class Between extends BaseMXMLMatcher {

        private var _minimum:Number;
        private var _maximum:Number;

        public function Between() {
            super();
        }

        [Bindable('minChanged')]
        public function get min():Number {
            return _minimum;
        }

        public function set min(value:Number):void {
            if (_minimum == value) {
                return;
            }

            _minimum = value;
            changed('min');
        }

        [Bindable('maxChanged')]
        public function get max():Number {
            return _maximum;
        }

        public function set max(value:Number):void {
            if (_maximum == value) {
                return;
            }

            _maximum = value;
            changed('max');
        }

        override protected function createMatcher():Matcher {
            return between(min, max);
        }
    }
}