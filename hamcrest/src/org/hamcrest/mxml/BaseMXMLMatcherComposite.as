package org.hamcrest.mxml
{
    import flash.events.Event;

    import org.hamcrest.Description;

    [DefaultProperty('matcher')]

    /**
     * Dispatched when the <code>matcher</code> property changes.
     */
    [Event(name='matcherChanged', type = 'flash.events.Event')]

    // TODO example
    /**
     * MXMLMatcher that composes another MXMLMatcher.
     *
     * @author Drew Bourne
     */
    public class BaseMXMLMatcherComposite extends BaseMXMLMatcher implements MXMLMatcherComposite
    {
        private var _matcher:MXMLMatcher;

        /**
         * Constructor.
         */
        public function BaseMXMLMatcherComposite()
        {
            super();
        }

        /**
         * MXMLMatcher that this Matcher composes.
         */
        [Bindable('matcherChanged')]
        public function get matcher():MXMLMatcher
        {
            return _matcher;
        }

        public function set matcher(value:MXMLMatcher):void
        {
            if (_matcher != value)
            {
                _matcher = value;
                changed('matcher');
            }
        }
    }
}