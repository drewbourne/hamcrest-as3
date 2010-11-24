package org.hamcrest.mxml
{
	import flash.events.Event;
	
	import org.hamcrest.Description;
	
	[DefaultProperty("matcher")]
	
	/**
	 * Dispatched when the <code>matcher</code> property changes.
	 */
	[Event(name="matcherChanged", type="flash.events.Event")]
	
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
		[Bindable("matcherChanged")]
		public function get matcher():MXMLMatcher
		{
			return _matcher;
		}
		
		public function set matcher(value:MXMLMatcher):void
		{
			if (_matcher != value)
			{
				if (_matcher)
					removeMatcherEventListeners(_matcher);
				
				_matcher = value;
				
				if (_matcher)
					addMatcherEventListeners(_matcher);
				
				changed("matcher");
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