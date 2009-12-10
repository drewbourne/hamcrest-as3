package org.hamcrest.mxml.collection
{
	import org.hamcrest.Matcher;
	import org.hamcrest.collection.inArray;
	import org.hamcrest.mxml.BaseMXMLMatcher;

	[DefaultProperty("elements")]
	
	/**
	 * 
	 */
	public class InArray extends BaseMXMLMatcher
	{
		private var _elements:Array;
		
		/**
		 * Constructor.
		 */
		public function InArray()
		{
			super();
			invalidateProperties();
		}
		
		/**
         * Array of elements (values or Matchers).
         */
        [ArrayElementType('Object')]
        [Bindable('elementsChanged')]
        public function get elements():Array
        {
            return _elements;
        }

        public function set elements(value:Array):void
        {
            if (_elements != value)
            {
                _elements = value;
                changed('elements');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return inArray.apply(null, elements || []);
        }        		
	}
}