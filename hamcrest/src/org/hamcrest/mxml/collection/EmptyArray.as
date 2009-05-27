package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.emptyArray;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    public class EmptyArray extends BaseMXMLMatcher {

        private var _size:int;

        public function EmptyArray() {
            super();
        }

        override protected function createMatcher():Matcher {
            return emptyArray();
        }
    }
}
