package org.hamcrest.mxml.core
{
	import org.hamcrest.Matcher;
	import org.hamcrest.core.evaluate;
	import org.hamcrest.mxml.BaseMXMLMatcher;
	
	/**
	 * MXML facade for the evaluate() / EvaluateMatcher.
	 * 
	 * Used in coordination with Hamcrest's <code>AnyOf</code> and <code>AllOf</code> MXML tags to express 
	 * conditional logic as a short-circuit functional style expression.
	 * 
 	 * This matcher is most powerful when used in combination with other Hamcrest's MXML tags, where the 
	 * <code>condition</code> property of an Evaluate tag can be populated via MXML bindings.
	 * 
	 * Additionally, complex composition of matcher evaluations pertaining to multiple objects can be achieved 
	 * by binding the <code>matched</code> property from one MXML matcher into the <code>condition</code> property of 
	 * an <code>Evaluate</code> tag used in the definition of another MXML matcher.
	 * 
	 * @see org.hamcrest.core#evaluate()
	 * @see org.hamcrest.core.EvaluateMatcher
	 * @see org.hamcrest.mxml.core.Given
 	 * 
	 * @example
	 * <listing version="3.0">
	 *  &lt;hc:Evaluate condition="{ 1 + 1 == 2 }" /&gt;
	 *  &lt;hc:Evaluate condition="{ nameInput.enabled }" /&gt;
	 *  &lt;hc:Evaluate condition="{ anotherMatcher.matched }" /&gt;
	 * </listing>
	 * 
	 * @author John Yanarella
	 */
	public class Evaluate extends BaseMXMLMatcher
	{
		// ========================================
		// Protected properties
		// ========================================			
		
		/**
		 * Backing variable for <code>condition</code> property.
		 */
		protected var _condition:Boolean = true;
		
		// ========================================
		// Public properties
		// ========================================			
		
		[Bindable( "conditionChanged" )]
		/**
		 * Boolean condition to be evaluated.
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
		
		// ========================================
		// Constructor
		// ========================================	
		
		/**
		 * Constructor.
		 */
		public function Evaluate()
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
			return evaluate( condition );
		}
	}
}