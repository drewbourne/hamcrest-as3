package org.hamcrest.filter
{
	import flash.events.IEventDispatcher;

	[Event( name="enabledChanged", type="flash.events.Event" )]
	
	/**
	 * Describes methods an IFilterFunction is expected to implement.
	 *
	 * @author John Yanarella
	 */
	public interface IFilterFunction extends IEventDispatcher
	{
		[Bindable( "enabledChanged" )]
		/**
		 * Indicates whether this FilterFunction is enabled.
		 */
		function get enabled():Boolean;
		function set enabled( value:Boolean ):void;
		
		/**
		 * Evaluates the specified item to determine if it meets the filtering criteria.
		 */
		function filter( item:Object ):Boolean
	}
}