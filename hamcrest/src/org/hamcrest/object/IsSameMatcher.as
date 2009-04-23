package org.hamcrest.object {

    import org.hamcrest.BaseMatcher;
    import org.hamcrest.Description;

    public class IsSameMatcher extends BaseMatcher {

        private var _value:Object;

        public function IsSameMatcher(value:Object) {
            _value = value;
        }

        override public function matches(item:Object):Boolean {
            return item == _value;
        }

        override public function describeTo(description:Description):void {
            description.appendText("sameInstance(").appendValue(_value).appendText(")");
        }
    }
}
