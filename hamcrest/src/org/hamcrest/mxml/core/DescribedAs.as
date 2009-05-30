package org.hamcrest.mxml.core {

    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.core.describedAs;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    /**
     * MXML facade for the describedAs() / DescribedAsMatcher.
     *
     * @see org.hamcrest.core.describedAs
     * @see org.hamcrest.core.DescribedAsMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:DescribedAs message="four">
     *      <hc:EqualTo value="{ 4 }" />
     *  </hc:DescribedAs>
     * </listing>
     */
    public class DescribedAs extends BaseMXMLMatcherComposite {

        private var _message:String;
        private var _values:Array;

        /**
         * Constructor.
         */
        public function DescribedAs() {
            super();
        }

        [Bindable('messageChanged')]
        public function get message():String {
            return _message;
        }

        public function set message(value:String):void {
            if (_message != value) {
                _message = value;
                changed('message');
            }
        }

        [Bindable('valuesChanged')]
        public function get values():Array {
            return _values;
        }

        public function set values(value:Array):void {
            if (_values != value) {
                _values = value;
                changed('values');
            }
        }

        override protected function createMatcher():Matcher {
            return describedAs.apply(null, [message, matcher].concat(values || []));
        }
    }
}
