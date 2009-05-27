package org.hamcrest.mxml.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.arrayWithSize;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    public class ArrayWithSize extends BaseMXMLMatcher {

        private var _size:int;

        public function ArrayWithSize() {
            super();
        }

        public function get size():int {
            return _size;
        }

        public function set size(value:int):void {
            _size = value;
        }

        override protected function createMatcher():Matcher {
            return arrayWithSize(size);
        }
    }
}
