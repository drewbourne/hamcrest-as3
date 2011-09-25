package org.hamcrest.object
{
	import org.hamcrest.AbstractMatcherTestCase;
	import org.hamcrest.test.support.ExampleClass;
	import org.hamcrest.test.support.ExampleInterface;

	public class IsInterfaceTest extends AbstractMatcherTestCase
	{
		[Test]
		public function should_match_interface():void 
		{
			assertMatches("interface", 
				isInterface(), ExampleInterface);
		}
		
		[Test]
		public function should_not_match_class():void 
		{
			assertDoesNotMatch("class", 
				isInterface(), ExampleClass);
		}
		
		[Test]
		public function describes_matcher():void 
		{
			assertDescription("an interface", 
				isInterface());
		}
		
		[Test]
		public function describes_mismatch():void 
		{
			assertMismatch("was <[class ExampleClass]>", 
				isInterface(), ExampleClass);
		}
	}
}