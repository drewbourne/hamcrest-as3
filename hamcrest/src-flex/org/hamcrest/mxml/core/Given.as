package org.hamcrest.mxml.core
{
	import org.hamcrest.Matcher;
	import org.hamcrest.core.given;
	import org.hamcrest.mxml.BaseMXMLMatcherComposite;

	/**
	 * MXML facade for the given() / GivenMatcher.
	 * 
	 * Used in coordination with Hamcrest's <code>AnyOf</code> and <code>AllOf</code> MXML tags to express 
	 * conditional logic as a short-circuit functional style expression.
	 * 
	 * Syntax shortcut (vs the <code>Evaluate</code> MXML tag) for expressing simple conditional matcher logic.
	 * 
 	 * This matcher is most powerful when used in combination with other Hamcrest's MXML tags, where the 
	 * <code>condition</code> property of a Given tag can be populated via MXML bindings.
	 * 
	 * Additionally, complex composition of matcher evaluations pertaining to multiple objects can be achieved 
	 * by binding the <code>matched</code> property from one MXML matcher into the <code>condition</code> property of 
	 * a <code>Given</code> tag used in the definition of another MXML matcher.
 	 *
	 * @see org.hamcrest.core#given()
	 * @see org.hamcrest.core.GivenMatcher
	 * @see org.hamcrest.mxml.core.Evaluate
	 * 
	 * @example
	 * <listing version="3.0">
	 *  &lt;hc:Given condition="{ model.isQuantityRestricted }"&gt;
	 *      &lt;hc:LessThanOrEqualTo value="{ model.restrictedQuantity }" /&gt;
	 *  &lt;hc:Given&gt;
	 * 
	 *  &lt;hc:Given condition="{ valueInput.enabled }" otherwise="true"&gt;
	 *      &lt;hc:ContainsString string="required substring" /&gt;
	 *  &lt;hc:Given&gt;
	 * 
	 *  &lt;hc:Given condition="{ anotherMatcher.matches }" otherwise="true"&gt;
	 *      &lt;hc:EqualTo value="5" /&gt;
	 *  &lt;hc:Given&gt;
	 * </listing>
	 * 
	 * @author John Yanarella
	 */
	public class Given extends BaseMXMLMatcherComposite
	{
		// ========================================
		// Protected properties
		// ========================================			
		
		/**
		 * Backing variable for <code>condition</code> property.
		 */
		protected var _condition:Boolean = true;
		
		/**
		 * Backing variable for <code>otherwise</code> property.
		 */
		protected var _otherwise:Boolean = false;
		
		// ========================================
		//  Public properties
		// ========================================			
		
		[Bindable( "conditionChanged" )]
		/**
		 * Condition that must be met before the <code>matcher</code> is evaluated.
		 */
		public function get condition():Boolean
		{
			return _condition;
		}
		
		public function set condition( value:Boolean ):void
		{
			if ( value != _condition )
			{
				_condition = value;
				
				changed( "condition" );
			}
		}
		
		[Bindable( "otherwiseChanged" )]
		/**
		 * Value to return if the given condition is not met (i.e. <code>condition</code> is false).
		 */
		public function get otherwise():Boolean
		{
			return _otherwise;
		}
		
		public function set otherwise( value:Boolean ):void
		{
			if ( value != _otherwise )
			{
				_otherwise = value;
				
				changed( "otherwise" );
			}
		}

		// ========================================
		// Constructor
		// ========================================	
		
		/**
		 * Constructor.
		 */
		public function Given()
		{
			super();
		}
		
		// ========================================
		// Protected methods
		// ========================================	
		
		/**
		 * @inheritDoc
		 */
		override protected function createMatcher():Matcher
		{
			return given( condition, matcher, otherwise );
		}
	}
}