package org.hamcrest.mxml.text
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.containsString;

    [DefaultProperty('string')]

    /**
     * Dispatched when the <code>string</code> property is changed.
     */
    [Event(name='stringChanged', type = 'flash.events.Event')]

    /**
     * BaseMXMLMatcher for string matcher
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class StringMXMLMatcher extends BaseMXMLMatcher
    {
        private var _string:String;

        /**
         * Constructor.
         */
        public function StringMXMLMatcher()
        {
            super();
        }

        /**
         * String value to match with.
         */
        [Bindable('stringChanged')]
        public function get string():*
        {
            return _string;
        }

        public function set string(value:*):void
        {
            if (_string != value)
            {
                _string = value;
                changed('string');
            }
        }
    }
}
