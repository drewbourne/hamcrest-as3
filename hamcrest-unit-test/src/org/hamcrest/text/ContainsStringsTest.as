package org.hamcrest.text
{
	import org.hamcrest.AbstractMatcherTestCase;

	public class ContainsStringsTest extends AbstractMatcherTestCase
	{
		[Test]
		public function matches_withArrayOfStrings():void 
		{
			assertMatches("contains all", containsStrings(["a", "lazy", "fox"]), "a quick brown fox jumps over the lazy dog");
			assertDoesNotMatch("contains none", containsStrings(["a", "lazy", "fox"]), "pack my box with five dozen liquor jugs"); 
		}
		
		[Test]
		public function matches_withParametersOfStrings():void
		{
			assertMatches("contains all", containsStrings("a", "lazy", "fox"), "a quick brown fox jumps over the lazy dog");
			assertDoesNotMatch("contains none", containsStrings("a", "lazy", "fox"), "pack my box with five dozen liquor jugs");
		}
		
		[Test]
		public function describesItself():void 
		{
			assertDescription('a String containing all of ["a","lazy","fox"]', containsStrings("a", "lazy", "fox"));
		}
		
		[Test]
		public function describesMismatches():void 
		{
			assertMismatch('was "Jump by vow of quick, lazy strength in Oxford." did not contain ["fox","dog"]', 
				containsStrings("a", "lazy", "fox", "dog"), 
				"Jump by vow of quick, lazy strength in Oxford.");
		}
	}
}