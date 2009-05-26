package org.hamcrest.mxml.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.core.anyOf;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    public class AnyOf extends BaseMXMLMatcherContainer {

        private var _matchers:Array;

        public function AnyOf() {
            super();
        }

        override protected function createMatcher():Matcher {
            return anyOf.apply(null, matchers);
        }
    }
}
