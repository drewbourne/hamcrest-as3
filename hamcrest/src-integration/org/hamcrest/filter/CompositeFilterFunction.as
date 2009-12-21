package org.hamcrest.filter
{
	import flash.events.Event;
	
	import mx.core.IMXMLObject;

	[DefaultProperty( "filterFunctions" )]
	
	[Event( name="filterFunctionsChanged", type="flash.events.Event" )]
	
	[Event( name="modeChanged", type="flash.events.Event" )]
	
	/**
	 * Defines an MXML composite filter function from multiple filter functions.
	 *
	 * @see org.hamcrest.filter.FilterFunction
	 * @see org.hamcrest.filter.IFilterFunction
	 *
	 * @example
	 * <listing version="3.0">
	 * &lt;CompositeFilterFunction id="enabledFilters" mode="all"&gt;
	 *     &lt;FilterFunction enabled="{ nameInput.text.length > 0 }"&gt;
	 *         &lt;HasProperty property="name" value="{ nameInput.text }" /&gt;
	 *     &lt;/FilterFunction&gt;
	 *     <FilterFunction enabled="{ addressInput.text.length > 0 }"&gt;
	 *         &lt;HasProperty property="address"&gt;
	 *                &lt;ContainsString string="{ addressInput.text }" /&gt;
	 *         &lt;/HasProperty&gt;
	 *     &lt;/FilterFunction&gt;
	 * &lt;/CompositeFilterFunction&gt;
	 * </listing>
	 *
	 * @author John Yanarella
	 */
	public class CompositeFilterFunction extends BaseFilterFunction implements IMXMLObject, IFilterFunction
	{
		// ========================================
		// Protected properties
		// ========================================	
		
		[ArrayElementType("org.hamcrest.filter.IFilterFunction")]
		/**
		 * Backing variable for <code>filterFunctions</code> property.
		 */
		protected var _filterFunctions:Array;
		
		[Inspectable(defaultValue="all", type="String", enumeration="any,all")]
		/**
		 * Backing variable for <code>mode</code> property.
		 */
		protected var _mode:String = "all";

		// ========================================
		// Protected properties
		// ========================================	

		[ArrayElementType("org.hamcrest.filter.IFilterFunction")]
		[Bindable( "filterFunctionsChanged" )]
		/**
		 * IFilterFunctions for this CompositeFilterFunction to combine.
		 */
		public function get filterFunctions():Array
		{
			return _filterFunctions;
		}
		
		public function set filterFunctions( value:Array ):void
		{
			if ( value != _filterFunctions )
			{
				_filterFunctions = value;
				
				dispatchEvent( new Event( "filterFunctionsChanged" ) );
			}
		}
		
		/**
		 * Composition mode - 'any' or 'all'.
		 */
		public function get mode():String
		{
			return _mode;
		}
		
		public function set mode( value:String ):void
		{
			if ( value != _mode )
			{
				_mode = value;
				
				dispatchEvent( new Event( "modeChanged" ) );
			}
		}
		
		// ========================================
		// Constructor
		// ========================================	
		
		/**
		 * Constructor.
		 */
		public function CompositeFilterFunction()
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
			switch ( mode )
			{
				default:
				case "all":
					return combineAll;
				
				case "any":
					return combineAny;
			}
		}
		
		/**
		 * Combines the enabled filter functions into a composite filter function where all filter conditions should be met.
		 */
		protected function combineAll( item:Object ):Boolean
		{
			for each ( var filterFunction:IFilterFunction in _filterFunctions )
			{
				if ( filterFunction.enabled )
				{
					if ( !filterFunction.filter( item ) )
						return false;
				}
			}
		
			return true;
		}

		/**
		 * Combines the enabled filter functions into a composite filter function where any filter condition should be met.
		 */
		protected function combineAny( item:Object ):Boolean
		{
			for each ( var filterFunction:IFilterFunction in _filterFunctions )
			{
				if ( filterFunction.enabled )
				{
					if ( filterFunction.filter( item ) )
						return true;
				}
			}
			
			return false;
		}
	}
}