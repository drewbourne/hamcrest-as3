package org.hamcrest.mxml.object {

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.hasProperties;

    /**
     * MXML wrapper for hasProperties Matcher.
     */
    public class HasProperties extends BaseMXMLMatcher {

        private var _properties:Object;

        /**
         * Constructor.
         */
        public function HasProperties() {
            super();
        }

        /**
         * Property name target object must have.
         */
        [Bindable('propertiesChanged')]
        public function get properties():* {
            return _properties;
        }

        public function set properties(value:*):void {
            if (value == _properties) {
                return;
            }

            _properties = value;
            changed('properties');
        }

        override protected function createMatcher():Matcher {
            return hasProperties(properties);
        }
    }
}
