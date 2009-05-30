package org.hamcrest.mxml.date {

    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.date.dateBetween;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML facade for the dateBetween() / DateBetweenMatcher.
     *
     * @see org.hamcrest.date.dateBetween
     * @see org.hamcrest.date.DateBetweenMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:DateBetween min="{ today() }" max="{ advanceDate(today(), { month: 1 }) }" />
     * </listing>
     */
    public class DateBetween extends BaseMXMLMatcher {

        private var _min:Date;
        private var _max:Date;
        private var _exclusive:Boolean;

        /**
         * Constructor.
         */
        public function DateBetween() {
            super();
        }

        /**
         * Date the target value must be after.
         */
        [Bindable('minChanged')]
        public function get min():Date {
            return _min;
        }

        public function set min(value:Date):void {
            if (_min != value) {
                _min = value;
                changed('min');
            }
        }

        /**
         * Date the target value must be before.
         */
        [Bindable('maxChanged')]
        public function get max():Date {
            return _max;
        }

        public function set max(value:Date):void {
            if (_max != value) {
                _max = value;
                changed('max');
            }
        }

        /**
         * Indicates whether to exclude the exact min and max values.
         */
        [Bindable('exclusiveChanged')]
        public function get exclusive():Boolean {
            return _exclusive;
        }

        public function set exclusive(value:Boolean):void {
            _exclusive = value;
            changed('exclusive');
        }

        override protected function createMatcher():Matcher {
            return dateBetween(min, max, exclusive);
        }
    }
}
