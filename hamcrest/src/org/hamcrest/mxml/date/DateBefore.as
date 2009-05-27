package org.hamcrest.mxml.date {

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateBefore;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    public class DateBefore extends BaseMXMLMatcher {

        private var _date:Date;

        public function DateBefore() {
            super();
        }

        public function get date():Date {
            return _date;
        }

        public function set date(value:Date):void {
            _date = value;
        }

        override protected function createMatcher():Matcher {
            return dateBefore(date);
        }
    }
}
