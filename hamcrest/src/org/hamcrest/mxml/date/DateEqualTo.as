package org.hamcrest.mxml.date {

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateEqual;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    public class DateEqualTo extends BaseMXMLMatcher {

        private var _date:Date;

        public function DateEqualTo() {
            super();
        }

        public function get date():Date {
            return _date;
        }

        public function set date(value:Date):void {
            _date = value;
        }

        override protected function createMatcher():Matcher {
            return dateEqual(date);
        }
    }
}
