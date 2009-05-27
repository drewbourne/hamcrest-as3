package org.hamcrest.mxml.date {

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateAfter;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    public class DateAfter extends BaseMXMLMatcher {

        private var _date:Date;

        public function DateAfter() {
            super();
        }

        public function get date():Date {
            return _date;
        }

        public function set date(value:Date):void {
            _date = value;
        }

        override protected function createMatcher():Matcher {
            return dateAfter(date);
        }
    }
}
