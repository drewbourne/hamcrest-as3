package org.hamcrest.text {

    public class StringContainsMatcher extends SubstringMatcher {

        public function StringContainsMatcher(substring:String) {
            super(substring);
        }

        override protected function evalSubstringOf(s:String):Boolean {
            return s.indexOf(substring) >= 0;
        }

        override protected function relationship():String {
            return "containing";
        }
    }
}
