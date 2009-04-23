package org.hamcrest {

    /**
     * Thrown by <code>assertThat</code>.
     *
     * @see org.hamcrest.assertThat
     */
    public class AssertionError extends Error {

        private var _cause:Error;

        /**
         * @param message Description of assertion failure
         * @param cause Error that caused the assertion failure, or null.
         */
        public function AssertionError(message:String, cause:Error = null) {

            super(message);

            _cause = cause;
        }

        /**
         * @return Error that caused the assertion failure, or null.
         */
        public function get cause():Error {

            return _cause;
        }

        /**
         * @return String including the stack trace from <code>cause</code>.
         */
        override public function getStackTrace():String {

            var stackTrace:String = super.getStackTrace();

            if (_cause) {
                stackTrace += "\n\n";
                stackTrace += "Nested Error:\n";
                stackTrace += _cause.getStackTrace();
            }

            return stackTrace;
        }
    }
}
