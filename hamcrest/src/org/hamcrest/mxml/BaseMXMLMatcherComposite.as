package org.hamcrest.mxml {

    import flash.events.Event;

    import org.hamcrest.Description;

    [DefaultProperty('matcher')]

    /**
     * Dispatched when the <code>matcher</code> property changes.
     */
    [Event(name='matcherChanged', type = 'flash.events.Event')]

    /**
     * MXMLMatcher that composes another MXMLMatcher.
     */
    public class BaseMXMLMatcherComposite extends BaseMXMLMatcher implements MXMLMatcherComposite {

        private var _matcher:MXMLMatcher;
        private var _matcherChanged:Boolean;

        /**
         * Constructor.
         */
        public function BaseMXMLMatcherComposite() {
            super();
        }

        /**
         * MXMLMatcher that this Matcher composes.
         */
        [Bindable('matcherChanged')]
        public function get matcher():MXMLMatcher {
            return _matcher;
        }

        public function set matcher(value:MXMLMatcher):void {
            if (_matcher != value) {
                _matcher = value;
                changed('matcher');
            }
        }
    }
}