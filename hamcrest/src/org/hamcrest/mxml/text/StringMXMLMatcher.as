package org.hamcrest.mxml.text
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    [DefaultProperty('string')]

    /**
     * Dispatched when the <code>string</code> property is changed.
     */
    [Event(name='stringChanged', type = 'flash.events.Event')]

    /**
     * BaseMXMLMatcher for matching Strings.
     *
     * @author Drew Bourne
     */
    public class StringMXMLMatcher extends BaseMXMLMatcher
    {
        private var _string:String;
		private var _ignoreCase:Boolean;

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
		
		[Inspectable(enumeration="true,false", defaultValue="false")]
		[Bindable("ignoreCaseChanged")]
		/**
		 * Indicates if the String matches should be case-insensitive. 
		 */
		public function get ignoreCase():Boolean 
		{
			return _ignoreCase;
		}
		
		public function set ignoreCase(value:Boolean):void 
		{
			if (_ignoreCase != value)
			{
				_ignoreCase = value;
				changed('ignoreCase');
			}
		}
    }
}
