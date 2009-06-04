package org.hamcrest.mxml
{
    import flash.events.Event;

    [DefaultProperty('matchers')]

    /**
     * Dispatched when the <code>matchers</code> property is changed.
     */
    [Event(name='matchersChanged', type = 'flash.events.Event')]

    /**
     * MXMLMatcher that composes zero or more MXMLMatchers.
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class BaseMXMLMatcherContainer extends BaseMXMLMatcher
    {
        private var _matchers:Array;
        private var _matchersChanged:Boolean;

        /**
         * Constructor.
         */
        public function BaseMXMLMatcherContainer()
        {
            super();
        }

        /**
         * Array of MXMLMatchers.
         */
        [ArrayElementType('org.hamcrest.mxml.MXMLMatcher')]
        [Bindable('matchersChanged')]
        public function get matchers():Array
        {
            return _matchers;
        }

        public function set matchers(value:Array):void
        {
            if (_matchers != value)
            {
                _matchers = value;
                changed('matchers');
            }
        }

    }
}