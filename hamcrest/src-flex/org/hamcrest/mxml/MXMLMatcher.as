package org.hamcrest.mxml
{
    import flash.events.IEventDispatcher;
    
    import org.hamcrest.Matcher;

	/**
	 * Dispatched when the <code>target</code> property changes.
	 */
	[Event(name='targetChanged', type = 'flash.events.Event')]
	
	/**
	 * Dispatched when the <code>description</code> property changes.
	 */
	[Event(name='descriptionChanged', type = 'flash.events.Event')]
	
	/**
	 * Dispatched when the <code>mismatchDescription</code> property changes.
	 */
	[Event(name='mismatchDescriptionChanged', type = 'flash.events.Event')]
	
	/**
	 * Dispatched when the <code>matched</code> property changes.
	 */
	[Event(name='matchedChanged', type = 'flash.events.Event')]
	
    /**
     * Interface for MXML façades to Hamcrest Matchers.
     *
     * @author Drew Bourne
     */
    public interface MXMLMatcher extends Matcher, IEventDispatcher
    {
        /**
         * Value to match against the Matcher.
         */
        function get target():*;

        function set target(value:*):void;

        /**
         * Description of the Matcher.
         */
        function get description():String;

        /**
         * Description of the mismatch if the target does not match the Matcher, or null.
         */
        function get mismatchDescription():String;

        /**
         * Indicates if the #target matches the Matcher.
         */
        function get matched():Boolean;
    }
}
