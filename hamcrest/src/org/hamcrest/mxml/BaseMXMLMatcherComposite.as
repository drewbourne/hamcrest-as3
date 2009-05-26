package org.hamcrest.mxml {

    import flash.events.Event;

    import org.hamcrest.Description;

    [Event(name='matcherChanged', type = 'flash.events.Event')]

    [DefaultProperty('matcher')]

    public class BaseMXMLMatcherComposite extends BaseMXMLMatcher implements MXMLMatcherComposite {

        private var _matcher:MXMLMatcher;
        private var _matcherChanged:Boolean;

        public function BaseMXMLMatcherComposite() {
            super();
        }

        [Bindable('matcherChanged')]
        public function get matcher():MXMLMatcher {
            return _matcher;
        }

        public function set matcher(value:MXMLMatcher):void {
            if (_matcher == value) {
                return;
            }

            _matcher = value;
            _matcherChanged = true;
            dispatchEvent(new Event('matcherChanged'));
            invalidateProperties();
        }
    }
}