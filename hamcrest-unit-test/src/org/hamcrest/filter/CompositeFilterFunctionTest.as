package org.hamcrest.filter
{
	import org.flexunit.Assert;
	import org.hamcrest.core.anything;
	import org.hamcrest.core.not;
	
	public class CompositeFilterFunctionTest extends Assert
	{
		private var compositeFilterFunction:CompositeFilterFunction;
		
		[Before]
		public function setup():void
		{
			compositeFilterFunction = new CompositeFilterFunction();
			compositeFilterFunction.mode = "all";
		}

		[Test]
		public function isEnabledByDefault():void
		{
			assertEquals( compositeFilterFunction.enabled, true );
		}

		[Test]
		public function isModeAllByDefault():void
		{
			assertEquals( compositeFilterFunction.mode, "all" );
		}

		[Test]
		public function returnsTrueIfFilterFunctionsIsNull():void
		{
			compositeFilterFunction.filterFunctions = null;

			assertTrue( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsTrueIfNoFilterFunctions():void
		{
			compositeFilterFunction.filterFunctions = [];
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsTrueIfFilterFunctionReturnsTrueInAllMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( true ) ];
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}

		[Test]
		public function returnsTrueIfAllFilterFunctionsReturnTrueInAllMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( true ), createFilterFunction( true ) ];
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}

		[Test]
		public function returnsFalseIfFilterFunctionReturnsFalseInAllMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( false ) ];
			
			assertFalse( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsFalseIfAnyFilterFunctionsReturnFalseInAllMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( true ), createFilterFunction( false ) ];
			
			assertFalse( compositeFilterFunction.filter( "test" ) );
		}

		[Test]
		public function returnsTrueIfFilterFunctionReturnsTrueInAnyMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( true ) ];
			compositeFilterFunction.mode = "any";
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsTrueIfAnyFilterFunctionsReturnTrueInAnyMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( false ), createFilterFunction( true ) ];
			compositeFilterFunction.mode = "any";
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsFalseIfFilterFunctionReturnsFalseInAnyMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( false ) ];
			compositeFilterFunction.mode = "any";
			
			assertFalse( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsFalseIfAllFilterFunctionsReturnFalseInAnyMode():void
		{
			compositeFilterFunction.filterFunctions = [ createFilterFunction( false ), createFilterFunction( false ) ];
			compositeFilterFunction.mode = "any";
			
			assertFalse( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsTrueIfIsNotEnabledAndFilterFunctionsIsNull():void
		{
			compositeFilterFunction.filterFunctions = null;
			compositeFilterFunction.enabled = false;
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}

		[Test]
		public function returnsTrueIfIsNotEnabledAndNoFilterFunctions():void
		{
			compositeFilterFunction.filterFunctions = [];
			compositeFilterFunction.enabled = false;
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}

		[Test]
		public function returnsTrueIfIsNotEnabledAndFilterFunctionsIsNullInAnyMode():void
		{
			compositeFilterFunction.filterFunctions = null;
			compositeFilterFunction.enabled = false;
			compositeFilterFunction.mode = "any";
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}
		
		[Test]
		public function returnsTrueIfIsNotEnabledAndNoFilterFunctionsInAnyMode():void
		{
			compositeFilterFunction.filterFunctions = [];
			compositeFilterFunction.enabled = false;
			compositeFilterFunction.mode = "any";
			
			assertTrue( compositeFilterFunction.filter( "test" ) );
		}
		
		protected function createFilterFunction( expectedResult:Boolean, enabled:Boolean = true ):IFilterFunction
		{
			var filterFunction:FilterFunction = new FilterFunction();
			
			filterFunction.enabled = enabled;
			filterFunction.matcher = ( expectedResult ) ? anything() : not( anything() );
			
			return filterFunction;
		}
	}
}