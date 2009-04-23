package org.hamcrest.number {

    import org.hamcrest.Description;
    import org.hamcrest.TypeSafeMatcher;

    public class IsGreaterThanMatcher extends TypeSafeMatcher {

        private var _value:Number;

        public function IsGreaterThanMatcher(value:Number) {
            super(Number);
            _value = value;
        }

        override public function matchesSafely(item:Object):Boolean {
            return Number(item) > _value;
        }

        override public function describeMismatch(item:Object, mismatchDescription:Description):void {
            mismatchDescription.appendValue(item)
                .appendText(" was less than ");

            mismatchDescription.appendValue(item);
        }

        override public function describeTo(description:Description):void {
            description.appendText("a value greater than ");
            description.appendValue(_value);
        }
    }
}
