package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.everyItem;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    public class EveryItem extends BaseMXMLMatcherComposite {

        public function EveryItem() {
            super();
        }

        override protected function createMatcher():Matcher {
            return everyItem(matcher);
        }
    }
}
