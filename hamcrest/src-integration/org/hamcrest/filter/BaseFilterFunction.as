package org.hamcrest.filter
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.IMXMLObject;
	
	[Event( name="enabledChanged", type="flash.events.Event" )]

	/**
	 * Abstract. Subclasses must override <code>createFilterFunction()</code>.
	 *
	 * @author John Yanarella
	 */
	public class BaseFilterFunction extends EventDispatcher implements IMXMLObject, IFilterFunction
	{
		// ========================================
		// Protected properties
		// ========================================	
		
		/**
		 * Backing variable for <code>enabled</code> property.
		 * 
		 * @private
		 */
		protected var _enabled:Boolean;
		
		// ========================================
		// Public properties
		// ========================================			

		[Bindable( "enabledChanged" )]
		/**
		 * @inheritDoc
		 */
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function set enabled( value:Boolean ):void
		{
			if ( _enabled != value )
			{
				_enabled = value;
				
				dispatchEvent( new Event( "enabledChanged" ) );
			}
		}
		
		// ========================================
		// Constructor
		// ========================================	
		
		/**
		 * Constructor.
		 */
		public function BaseFilterFunction()
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
			throw new IllegalOperationError('BaseFilterFunction#createFilterFunction must be override by subclass');
		}
	}
}