package org.hamcrest.mxml.object
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.hasProperties;

    /**
     * Dispatched when the <code>properties</code> property is changed.
     */
    [Event(name='propertiesChanged', type = 'flash.events.Event')]

    /**
     * MXML façade for hasProperties() Matcher.
     *
     * @see org.hamcrest.object#hasProperties()
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:HasProperties properties="{{ prop: value, other: otherValue }}" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class HasProperties extends BaseMXMLMatcher
    {
        private var _properties:Object;

        /**
         * Constructor.
         */
        public function HasProperties()
        {
            super();
        }

        /**
         * Property name target object must have.
         */
        [Bindable('propertiesChanged')]
        public function get properties():*
        {
            return _properties;
        }

        public function set properties(value:*):void
        {
            if (_properties != value)
            {
                _properties = value;
                changed('properties');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return hasProperties(properties);
        }
    }
}
