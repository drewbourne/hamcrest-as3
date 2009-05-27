package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.array;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    public class Array extends BaseMXMLMatcherContainer {

        public function Array() {
            super();
        }

        override protected function createMatcher():Matcher {
            return array.apply(null, matchers || []);
        }
    }
}
