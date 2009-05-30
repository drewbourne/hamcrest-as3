package org.hamcrest.mxml.date {

    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateBefore;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML facade for the dateBefore() / DateBeforeMatcher.
     *
     * @see org.hamcrest.date.dateBefore
     * @see org.hamcrest.date.DateBeforeMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:DateBefore date="{ new Date() }" />
     * </listing>
     */
    public class DateBefore extends BaseMXMLMatcher {

        private var _date:Date;

        /**
         * Constructor.
         */
        public function DateBefore() {
            super();
        }

        /**
         * Date the target value must be before.
         */
        [Bindable('dateChanged')]
        public function get date():Date {
            return _date;
        }

        public function set date(value:Date):void {
            if (_date != value) {
                _date = value;
                changed('date');
            }
        }

        override protected function createMatcher():Matcher {
            return dateBefore(date);
        }
    }
}
