package org.hamcrest.mxml.object {

    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.equalTo;

    /**
     * MXML wrapper for equalTo() / IsEqualMatcher.
     */
    public class EqualTo extends BaseMXMLMatcher {

        private var _value:*;
        private var _valueChanged:Boolean;

        /**
         * Constructor.
         */
        public function EqualTo() {
            super();
        }

        /**
         * Expected Value
         */
        [Bindable('valueChanged')]
        public function get value():* {
            return _value;
        }

        public function set value(value:*):void {
            if (value == _value) {
                return;
            }

            _value = value;
            changed('value');
        }

        override protected function createMatcher():Matcher {
            return equalTo(value);
        }
    }
}
