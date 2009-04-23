package org.hamcrest.number {

    import org.hamcrest.Description;
    import org.hamcrest.TypeSafeMatcher;

    public class IsCloseToMatcher extends TypeSafeMatcher {

        private var _value:Number;
        private var _delta:Number;

        public function IsCloseToMatcher(value:Number, error:Number) {
            super(Number);
            _value = value;
            _delta = error;
        }

        override public function matchesSafely(item:Object):Boolean {
            return (actualDelta(item as Number) <= 0.0);
        }

        override public function describeMismatch(item:Object, mismatchDescription:Description):void {
            mismatchDescription
                .appendValue(item)
                .appendText(" differed by ")
                .appendValue(actualDelta(item as Number));
        }

        override public function describeTo(description:Description):void {
            description
                .appendText("a numeric value within ")
                .appendValue(_delta)
                .appendText(" of ")
                .appendValue(_value);
        }

        protected function actualDelta(item:Number):Number {
            return (Math.abs((item - _value)) - _delta);
        }
    }
}