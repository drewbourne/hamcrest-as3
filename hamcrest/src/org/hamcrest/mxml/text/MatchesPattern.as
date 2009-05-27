package org.hamcrest.mxml.text {

    import flash.errors.IllegalOperationError;

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * MXML wrapper for nothing yet.
     */
    public class MatchesPattern extends BaseMXMLMatcher {

        private var _expression:String;
        private var _flags:String;

        /**
         * Constructor.
         */
        public function MatchesPattern() {
            super();
        }

        public function get expression():String {
            return _expression;
        }

        public function set expression(value:String):void {
            _expression = value;
        }

        public function get flags():String {
            return _flags;
        }

        public function set flags(value:String):void {
            _flags = value;
        }

        override protected function createMatcher():Matcher {
            throw new IllegalOperationError('MatchesPattern MXML facade doesnt yet have a Matcher implementation');
            return null;
        }
    }
}
