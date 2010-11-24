package org.hamcrest.filter
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.IMXMLObject;
	
	import org.hamcrest.Matcher;

	/**
	 * @inheritDoc
	 */
	[Event( name="matcherChanged", type="flash.events.Event" )]

	[DefaultProperty("matcher")]

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
	public class FilterFunction extends EventDispatcher implements IFilterFunction, IMXMLObject
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
		
		/**
		 * @inheritDoc
		 */
		public function get filterFunction():Function
		{
			return createFilterFunction();
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
		// Public methods
		// ========================================	

		/**
		 * @inheritDoc
		 */
		public function initialized(document:Object, id:String):void
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function filter( item:Object ):Boolean
		{
			return createFilterFunction().call( null, item );
		}
		
		// ========================================
		// Protected methods
		// ========================================	
	
		/**
		 * Create a filter function based on the current state.
		 */
		protected function createFilterFunction():Function
		{
			return ( _matcher != null ) ? _matcher.matches : defaultFilterFunction;
		}

		/**
		 * Default filter function.
		 */
		protected function defaultFilterFunction( item:Object ):Boolean
		{
			return true;
		}
	}
}