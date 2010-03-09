package org.hamcrest.filter
{
	import flash.events.IEventDispatcher;
	
	import org.hamcrest.Matcher;
	
	/**
	 * Dispatched when the <code>matcher</code> specified for an IFilterFunction is changed.
	 */
	[Event( name="matcherChanged", type="flash.events.Event" )]
	
	[DefaultProperty("matcher")]

	/**
	 * Describes the methods an IFilterFunction is expected to implement.
	 *
	 * @author John Yanarella
	 */
	public interface IFilterFunction extends IEventDispatcher
	{
		[Bindable( "matcherChanged" )]
		/**
		 * MXMLMatcher that defines the filtering criteria for this IFilterFunction.
		 */
		function get matcher():Matcher;
		function set matcher( value:Matcher ):void;
		
		/**
		 * Filter Function.
		 * 
		 * @returns A function that takes an item as a parameter and returns a Boolean value indicating whether the item meets the filtering criteria.
		 */
		function get filterFunction():Function;
		
		/**
		 * Evaluates the specified item to determine if it meets the filtering criteria defined in the <code>matcher</code>.
		 * 
		 * @param item An Object to evaluate against the filtering criteria.
		 * @returns A Boolean value indicating whether the item meets the filtering criteria.
		 */
		function filter( item:Object ):Boolean;
	}
}