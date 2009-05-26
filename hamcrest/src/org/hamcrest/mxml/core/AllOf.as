package org.hamcrest.mxml.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.core.allOf;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    public class AllOf extends BaseMXMLMatcherContainer {

        private var _matchers:Array;

        public function AllOf() {
            super();
        }

        override protected function createMatcher():Matcher {
            return allOf.apply(null, matchers);
        }
    }
}
