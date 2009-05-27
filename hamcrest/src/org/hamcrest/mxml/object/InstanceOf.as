package org.hamcrest.mxml.object {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.instanceOf;

    /**
     * MXML wrapper for instanceOf() Matcher
     */
    public class InstanceOf extends BaseMXMLMatcher {

        private var _type:Class;

        /**
         * Constructor.
         */
        public function InstanceOf() {
            super();
        }

        /**
         * Expected Value
         */
        [Bindable('typeChanged')]
        public function get type():Class {
            return _type;
        }

        public function set type(value:Class):void {
            if (value == _type) {
                return;
            }

            _type = value;
            changed('type');
        }

        override protected function createMatcher():Matcher {
            return instanceOf(type);
        }
    }
}
