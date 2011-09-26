package org.hamcrest.object 
{
	import org.hamcrest.AbstractMatcherTestCase;
	import org.hamcrest.Matcher;
	import org.hamcrest.assertThat;
	import org.hamcrest.number.greaterThan;
	import org.hamcrest.text.emptyString;
	
	public class NullOrMatcherTest extends AbstractMatcherTestCase 
	{
		private var matcher:Matcher;
		
		[Before]
		public function withMatcher():void 
		{
			matcher = nullOr(greaterThan(0));
		}
		
		[Test]
		public function nullOr_with_null_matches():void 
		{
			assertMatches("with null", matcher, null);
			assertMatches("with matching value", matcher, 1);
			assertDoesNotMatch("with non-matching value", matcher, 0);
		}
		
		[Test]
		public function describes_matcher():void 
		{
			assertDescription("(null or a value greater than <0>)", matcher);
		}
		
		[Test]
		public function describes_mismatch():void 
		{
			assertMismatch("was <0>", matcher, 0);	
		}
	}
}
