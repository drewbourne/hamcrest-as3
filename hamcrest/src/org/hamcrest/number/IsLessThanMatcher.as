package org.hamcrest.number {

    import org.hamcrest.Description;
    import org.hamcrest.TypeSafeMatcher;

    public class IsLessThanMatcher extends TypeSafeMatcher {

        private var _value:Number;
        private var _inclusive:Boolean;

        public function IsLessThanMatcher(value:Number, inclusive:Boolean=false) {
            super(Number);
            _value = value;
            _inclusive = inclusive;
        }

        override public function matchesSafely(item:Object):Boolean {
            return _inclusive
                ? Number(item) <= _value
                : Number(item) < _value;
        }

        override public function describeMismatch(item:Object, mismatchDescription:Description):void {
            mismatchDescription.appendValue(item)
                .appendText(" was greater than ");

            if (!_inclusive) {
                mismatchDescription.appendText("or equal to ")
            }

            mismatchDescription.appendValue(item);
        }

        override public function describeTo(description:Description):void {
            description.appendText("a value less than ");

            if (_inclusive) {
                description.appendText("or equal to ")
            }

            description.appendValue(_value);
        }
    }
}
