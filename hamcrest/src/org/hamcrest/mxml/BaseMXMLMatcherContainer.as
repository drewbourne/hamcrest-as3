package org.hamcrest.mxml {
    import flash.events.Event;


    [Event(name='matchersChanged', type = 'flash.events.Event')]

    [DefaultProperty('matchers')]

    public class BaseMXMLMatcherContainer extends BaseMXMLMatcher {

        private var _matchers:Array;
        private var _matchersChanged:Boolean;

        public function BaseMXMLMatcherContainer() {
            super();
        }

        [ArrayElementType('org.hamcrest.mxml.MXMLMatcher')]
        [Bindable('matchersChanged')]
        public function get matchers():Array {
            return _matchers;
        }

        public function set matchers(value:Array):void {
            if (_matchers == value) {
                return;
            }

            _matchers = value;
            _matchersChanged = true;
            dispatchEvent(new Event('matchersChanged'));
            invalidateProperties();
        }

    }
}