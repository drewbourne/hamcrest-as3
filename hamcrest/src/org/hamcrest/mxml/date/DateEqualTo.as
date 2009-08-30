package org.hamcrest.mxml.date
{
    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateEqual;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML facade for the dateEqual() / DateEqualMatcher
     *
     * @see org.hamcrest.date.dateEqual
     * @see org.hamcrest.date.DateEqualMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:DateEqualTo date="{ new Date() }" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class DateEqualTo extends BaseMXMLMatcher
    {
        private var _date:Date;

        /**
         * Constructor.
         */
        public function DateEqualTo()
        {
            super();
        }

        /**
         * Date the target value must be equal to.
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
            return dateEqual(date);
        }
    }
}
