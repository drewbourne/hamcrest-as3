package org.hamcrest.core
{
	import org.hamcrest.BaseMatcher;
	import org.hamcrest.Description;
	import org.hamcrest.DiagnosingMatcher;
	import org.hamcrest.Matcher;
	
	/**
	 * Checks if an item matches all of the given Matchers.
	 *
	 * @see org.hamcrest.core#anyOf()
	 *
	 * @author Drew Bourne
	 */
	public class AnyOfMatcher extends BaseMatcher
	{
		private var _matchers:Array;
		
		/**
		 * Constructor.
		 *
		 * @param matchers Array of Matcher instances
		 */
		public function AnyOfMatcher(matchers:Array)
		{
			super();
			
			// TODO check matchers are actually Matcher instances
			_matchers = matchers || [];
		}
		
		/**
		 * Matches an item with ANY of the matchers given to the constructor. Shortcuts on first match.
		 */
		override public function matches(item:Object):Boolean
		{
			for each (var matcher:Matcher in _matchers)
			{
				if (matcher.matches(item))
				{
					return true;	
				}
			}
			
			return false;
		}
		
		/**
		 * 
		 */
		override public function describeMismatch(item:Object, mismatchDescription:Description):void
		{
			var join:Boolean = false;
			
			for each (var matcher:Matcher in _matchers)
			{
				if (!matcher.matches(item))
				{
					if (join)
						mismatchDescription.appendText(" or ")
					
					mismatchDescription
						.appendDescriptionOf(matcher)
						.appendText(" ")
						.appendMismatchOf(matcher, item);
						
					join = true;
				}
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describeTo(description:Description):void
		{
			description.appendList("(", " or ", ")", _matchers);
		}
	}
}
