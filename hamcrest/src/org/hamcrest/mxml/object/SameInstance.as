package org.hamcrest.mxml.object {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.sameInstance;

    /**
     * MXML wrapper for sameInstance() Matcher
     */
    public class SameInstance extends BaseMXMLMatcher {

        private var _value:*;

        /**
         * Constructor.
         */
        public function SameInstance() {
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
            return sameInstance(value);
        }
    }
}
