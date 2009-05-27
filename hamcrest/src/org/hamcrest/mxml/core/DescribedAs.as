package org.hamcrest.mxml.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.core.describedAs;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    public class DescribedAs extends BaseMXMLMatcherComposite {

        private var _message:String;
        private var _values:Array;

        public function DescribedAs() {
            super();
        }

        public function get message():String {
            return _message;
        }

        public function set message(value:String):void {
            _message = value;
        }

        public function get values():Array {
            return _values;
        }

        public function set values(value:Array):void {
            _values = value;
        }

        override protected function createMatcher():Matcher {
            return describedAs.apply(null, [message, matcher].concat(values || []));
        }
    }
}
