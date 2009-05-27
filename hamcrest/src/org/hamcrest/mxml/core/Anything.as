package org.hamcrest.mxml.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.core.anything;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    public class Anything extends BaseMXMLMatcher {

        public function Anything() {
            super();
        }

        override protected function createMatcher():Matcher {
            return anything();
        }
    }
}
