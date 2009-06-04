package org.hamcrest.mxml.object
{
    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.equalTo;

    [DefaultProperty('value')]

    /**
     * Dispatched when the <code>value</code> property is changed.
     */
    [Event(name='valueChanged', type = 'flash.events.Event')]

    /**
     * MXML façade for equalTo() / IsEqualMatcher.
     *
     * @see org.hamcrest.object.equalTo
     * @see org.hamcrest.object.IsEqualMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:EqualTo value="{ 123 }" />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class EqualTo extends BaseMXMLMatcher
    {
        private var _value:*;

        /**
         * Constructor.
         */
        public function EqualTo()
        {
            super();
        }

        /**
         * Value the target value must match.
         */
        [Bindable('valueChanged')]
        public function get value():*
        {
            return _value;
        }

        public function set value(value:*):void
        {
            if (_value != value)
            {
                _value = value;
                changed('value');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return equalTo(value);
        }
    }
}
