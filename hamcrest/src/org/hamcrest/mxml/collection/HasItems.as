package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.hasItems;
    import org.hamcrest.mxml.BaseMXMLMatcherContainer;

    public class HasItems extends BaseMXMLMatcherContainer {

        public function HasItems() {
            super();
        }

        override protected function createMatcher():Matcher {
            return hasItems.apply(null, matchers);
        }
    }
}
