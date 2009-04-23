package org.hamcrest {

    /**
     * Description implementation that appends to a <code>String</code>.
     *
     * To get result call <code>toString()</code>.
     *
     * @see org.hamcrest.Description
     */
    public class StringDescription extends BaseDescription {

        /**
         * Converts a <code>SelfDescribing</code> implementation into a <code>String</code>.
         *
         * @see org.hamcrest.SelfDescribing
         */
        public static function toString(selfDescribing:SelfDescribing):String {
            return (new StringDescription()).appendDescriptionOf(selfDescribing).toString();
        }

        private var _out:String = "";

        public function StringDescription() {
            _out = "";
        }

        override protected function append(string:Object):void {
            _out += String(string);
        }

        override public function toString():String {
            return _out;
        }
    }
}
