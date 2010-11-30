package org.hamcrest.mxml
{
	import flash.events.Event;
	
	[DefaultProperty("matchers")]
	
	/**
	 * Dispatched when the <code>matchers</code> property is changed.
	 */
	[Event(name="matchersChanged", type="flash.events.Event")]
	
	/**
	 * MXMLMatcher that composes zero or more MXMLMatchers.
	 *
	 * @author Drew Bourne
	 */
	public class BaseMXMLMatcherContainer extends BaseMXMLMatcher
	{
		private var _matchers:Array;
		
		/**
		 * Constructor.
		 */
		public function BaseMXMLMatcherContainer()
		{
			super();
		}
		
		[ArrayElementType("org.hamcrest.mxml.MXMLMatcher")]
		[Bindable("matchersChanged")]
		/**
		 * Array of MXMLMatchers.
		 */
		public function get matchers():Array
		{
			return _matchers;
		}
		
		public function set matchers(value:Array):void
		{
			if (_matchers != value)
			{
				if (_matchers)
					removeMatchersEventListeners(_matchers);
				
				_matchers = value;
				
				if (_matchers)
					addMatchersEventListeners(_matchers);
				
				changed("matchers");
			}
		}
		
		protected function addMatchersEventListeners(matchers:Array):void
		{
			for each (var matcher:MXMLMatcher in matchers)
			{
				addMatcherEventListeners(matcher);
			}
		}
		
		protected function removeMatchersEventListeners(matchers:Array):void
		{
			for each (var matcher:MXMLMatcher in matchers)
			{
				removeMatcherEventListeners(matcher);
			}
		}
		
		protected function addMatcherEventListeners(matcher:MXMLMatcher):void
		{
			matcher.addEventListener("matchedChanged", matcher_matchedChanged, false, 0, true);
		}
		
		protected function removeMatcherEventListeners(matcher:MXMLMatcher):void
		{
			matcher.removeEventListener("matchedChanged", matcher_matchedChanged);
		}
		
		protected function matcher_matchedChanged(event:Event):void
		{
			invalidateProperties();
		}
	}
}