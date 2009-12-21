package org.hamcrest.filter
{
	import flash.events.Event;
	
	import mx.core.IMXMLObject;
	
	import org.hamcrest.Matcher;
	import org.hamcrest.mxml.MXMLMatcher;

	[DefaultProperty("matcher")]

	[Event( name="matcherChanged", type="flash.events.Event" )]

	/**
	 * Defines an MXML filter function based on a Matcher.
	 * 
	 * @see org.hamcrest.filter.IFilterFunction
	 *
	 * @example
	 * <listing version="3.0">
	 * &lt;hc:FilterFunction&gt;
	 *     &lt;hc:HasProperty property="name" value="{ nameInput.text }" /&gt;
	 * &lt;/hc:FilterFunction&gt;
	 * </listing>
	 *
	 * @author John Yanarella
	 */
	public class FilterFunction extends BaseFilterFunction implements IMXMLObject
	{
		// ========================================
		// Protected properties
		// ========================================	
		
		/**
		 * Backing variable for <code>matcher</code> property.
		 * 
		 * @private
		 */
		protected var _matcher:Matcher;

		// ========================================
		// Public properties
		// ========================================	
		
		[Bindable( "matcherChanged" )]
		/**
		 * MXMLMatcher that defines the filtering criteria for this FilterFunction.
		 */
		public function get matcher():Matcher
		{
			return _matcher;
		}
		
		public function set matcher( value:Matcher ):void
		{
			if ( _matcher != value )
			{
				_matcher = value;
				
				dispatchEvent( new Event( "matcherChanged" ) );
			}
		}

		// ========================================
		// Constructor
		// ========================================	
		
		/**
		 * Constructor.
		 */
		public function FilterFunction()
		{
			super();
		}

		// ========================================
		// Protected methods
		// ========================================	
	
		/**
		 * @inheritDoc
		 */
		override protected function createFilterFunction():Function
		{
			return ( _matcher != null ) ? _matcher.matches : null;
		}		
	}
}