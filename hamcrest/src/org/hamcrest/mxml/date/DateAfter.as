package org.hamcrest.mxml.date
{
    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateAfter;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML facade for the dateAfter() / DateAfterMatcher.
     *
     * @see org.hamcrest.date.dateAfter
     * @see org.hamcrest.date.DateAfterMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:DateAfter date="{ new Date() }" />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class DateAfter extends BaseMXMLMatcher
    {
        private var _date:Date;

        /**
         * Constructor.
         */
        public function DateAfter()
        {
            super();
        }

        /**
         * Date the target value must be after.
         */
        [Bindable('dateChanged')]
        public function get date():Date
        {
            return _date;
        }

        public function set date(value:Date):void
        {
            if (_date != value)
            {
                _date = value;
                changed('date');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return dateAfter(date);
        }
    }
}
