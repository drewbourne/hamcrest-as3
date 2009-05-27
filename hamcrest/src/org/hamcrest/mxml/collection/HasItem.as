package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    public class HasItem extends BaseMXMLMatcherComposite {

        public function HasItem() {
            super();
        }

        override protected function createMatcher():Matcher {
            return hasItem(matcher);
        }
    }
}
