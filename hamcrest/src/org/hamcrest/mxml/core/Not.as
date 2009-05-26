package org.hamcrest.mxml.core {

    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.core.not;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;

    public class Not extends BaseMXMLMatcherComposite {

        public function Not() {
            super();
        }

        override protected function createMatcher():Matcher {
            return not(matcher);
        }
    }
}
