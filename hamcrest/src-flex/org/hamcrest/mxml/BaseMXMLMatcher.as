package org.hamcrest.mxml
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.IMXMLObject;
	
	import org.hamcrest.Description;
	import org.hamcrest.Matcher;
	import org.hamcrest.StringDescription;
	
	/**
	 * Dispatched when the <code>target</code> property changes.
	 */
	[Event(name='targetChanged', type='flash.events.Event')]
	
	/**
	 * Dispatched when the <code>description</code> property changes.
	 */
	[Event(name='descriptionChanged', type='flash.events.Event')]
	
	/**
	 * Dispatched when the <code>mismatchDescription</code> property changes.
	 */
	[Event(name='mismatchDescriptionChanged', type='flash.events.Event')]
	
	/**
	 * Dispatched when the <code>matched</code> property changes.
	 */
	[Event(name='matchedChanged', type='flash.events.Event')]
	
	// TODO example
	/**
	 * BaseMXMLMatcher provides abstract functionality for Matchers to be used in MXML.
	 *
	 * MXMLMatcher implementations should subclass BaseMXMLMatcher and implement <code>createMatcher</code>.
	 *
	 * @author Drew Bourne
	 */
	public class BaseMXMLMatcher extends EventDispatcher implements MXMLMatcher, IMXMLObject
	{
		private var _target:*;
		private var _internalMatcher:Matcher;
		private var _matched:Boolean;
		private var _description:String;
		private var _mismatchDescription:String;
		private var _commitingProperties:Boolean;
		
		private var _internalMatcherDescription:StringDescription;
		private var _internalMismatchDescription:StringDescription;
		
		/**
		 * Constructor.
		 */
		public function BaseMXMLMatcher()
		{
			super();
			
			_internalMatcherDescription = new StringDescription();
			_internalMismatchDescription = new StringDescription();
		}
		
		[Bindable('targetChanged')]
		/**
		 * Target value that should be tested when matching.
		 */
		public function get target():*
		{
			return _target;
		}
		
		public function set target(value:*):void
		{
			if (_target != value)
			{
				_target = value;
				changed('target');
			}
		}
		
		[Bindable('descriptionChanged')]
		/**
		 * Description of the Matcher.
		 */
		public function get description():String
		{
			return _description;
		}
		
		protected function setDescription(value:String):void
		{
			if (_description != value)
			{
				_description = value;
				changed('description', false);
			}
		}
		
		[Bindable('matchedChanged')]
		/**
		 * Indicates if the target value matched succesfully.
		 */
		public function get matched():Boolean
		{
			return _matched;
		}
		
		protected function setMatched(value:Boolean):void
		{
			if (_matched != value)
			{
				_matched = value;
				changed('matched', false);
			}
		}
		
		[Bindable('mismatchDescriptionChanged')]
		[Bindable('matchedChanged')]
		/**
		 * Describes the mismatch when the target value does not match.
		 */
		public function get mismatchDescription():String
		{
			return _mismatchDescription;
		}
		
		public function setMismatchDescription(value:String):void
		{
			if (_mismatchDescription != value)
			{
				_mismatchDescription = value;
				changed('mismatchDescription', false);
			}
		}
		
		/**
		 * MXMLSupport
		 */
		public function initialized(document:Object, id:String):void
		{
		}
		
		/**
		 * Tests a value against this matcher
		 *
		 * @param value Value to match.
		 * @return <code>true</code> if matches, <code>false</code> otherwise.
		 */
		public function matches(value:Object):Boolean
		{
			return getOrCreateMatcher().matches(value);
		}
		
		/**
		 * Describes to the mismatchDescription why the value did not match.
		 */
		public function describeMismatch(value:Object, mismatchDescription:Description):void
		{
			getOrCreateMatcher().describeMismatch(value, mismatchDescription);
		}
		
		/**
		 * Describes this Matcher to the description.
		 */
		public function describeTo(description:Description):void
		{
			getOrCreateMatcher().describeTo(description);
		}
		
		/**
		 * Gets or creates the Matcher used for <code>matches()</code>.
		 */
		protected function getOrCreateMatcher():Matcher
		{
			if (!_internalMatcher)
			{
				_internalMatcher = createMatcher();
			}
			
			return _internalMatcher;
		}
		
		/**
		 * Creates the Matcher implementation for use in <code>matches</code>, <code>describeMismatch</code>, and <code>describeTo</code>.
		 */
		protected function createMatcher():Matcher
		{
			throw new IllegalOperationError("BaseMXMLMatcher#createMatcher must be overridden by subclass");
		}
		
		/**
		 * Clears the cached Matcher used for <code>matches()</code>.
		 */
		protected function clearMatcher():void
		{
			_internalMatcher = null;
		}
		
		/**
		 * Dispatches a <code>[property]Changed</code> Event, and invalidates the properties of this MXMLMatcher.
		 *
		 * @see #invalidateProperties()
		 */
		protected function changed(property:String, invalidates:Boolean = true):void
		{
			dispatchEvent(new Event(property + 'Changed'));
			
			if (invalidates)
			{
				invalidateProperties();
			}
		}
		
		/**
		 * Accumulates property changes, before calling <code>commitProperties</code>.
		 *
		 * @see #commitPropertie()
		 */
		protected function invalidateProperties():void
		{
			if (!_commitingProperties)
			{
				_commitingProperties = true;
				commitProperties();
				_commitingProperties = false;
			}
		}
		
		/**
		 * Updates the description, matched, and mismatchDescription properties if invalidated.
		 */
		protected function commitProperties():void
		{
			clearMatcher();
			evaluateDescription();
			evaluateMatchTarget();
		}
		
		/**
		 * Updates the description property with the description of this Matcher,
		 */
		protected function evaluateDescription():void
		{
			// TODO cache StringDescription instance?
			_internalMatcherDescription.clear();
			describeTo(_internalMatcherDescription);
			setDescription(_internalMatcherDescription.toString());
		}
		
		/**
		 * Updates the matched and mismatchDescription properties after testing the target value.
		 */
		protected function evaluateMatchTarget():void
		{
			// TODO cache StringDescription instance?
			_internalMismatchDescription.clear();
			
			var matchedTarget:Boolean = matches(target);
			if (!matchedTarget)
			{
				describeMismatch(target, _internalMismatchDescription);
			}
			
			setMismatchDescription(_internalMismatchDescription.toString());
			setMatched(matchedTarget);
		}
	
	}
}
