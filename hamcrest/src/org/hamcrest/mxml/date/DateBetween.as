package org.hamcrest.mxml.date {

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateBetween;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    public class DateBetween extends BaseMXMLMatcher {

        private var _min:Date;
        private var _max:Date;
        private var _exclusive:Boolean;

        public function DateBetween() {
            super();
        }

        public function get min():Date {
            return _min;
        }

        public function set min(value:Date):void {
            _min = value;
        }

        public function get max():Date {
            return _max;
        }

        public function set max(value:Date):void {
            _max = value;
        }

        public function get exclusive():Boolean {
            return _exclusive;
        }

        public function set exclusive(value:Boolean):void {
            _exclusive = value;
        }

        override protected function createMatcher():Matcher {
            return dateBetween(min, max, exclusive);
        }
    }
}
