package org.hamcrest.core
{

    import flexunit.framework.*;
    
    import org.hamcrest.*;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.hasProperty;
    import org.hamcrest.object.notNullValue;

    public class AnyOfTest extends AbstractMatcherTestCase
    {

        [Test]
        public function evaluatesToTheTheLogicalDisjunctionOfTwoOtherMatchers():void
        {
            assertThat("good", anyOf(equalTo("bad"), equalTo("good")));
            assertThat("good", anyOf(equalTo("good"), equalTo("good")));
            assertThat("good", anyOf(equalTo("good"), equalTo("bad")));

            assertThat("good", not(anyOf(equalTo("bad"), equalTo("bad"))));
        }

        [Test]
        public function evaluatesToTheTheLogicalDisjunctionOfManyOtherMatchers():void
        {
            assertThat("good", anyOf(equalTo("bad"), equalTo("good"), equalTo("bad"), equalTo("bad"),
                equalTo("bad")));
            assertThat("good", not(anyOf(equalTo("bad"), equalTo("bad"), equalTo("bad"), equalTo("bad"),
                equalTo("bad"))));
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("(\"good\" or \"bad\" or \"ugly\")",
                anyOf(equalTo("good"), equalTo("bad"), equalTo("ugly")));
        }
		
		[Test]
		public function mismatchDescriptionShouldIncludeMismatchDescriptionFromMismatchedMatchers():void 
		{
			var matcher:Matcher = anyOf(hasProperty("length", 3), hasItem("first"));
			
			assertMismatch('has property "length" with <3> property "length" was <0> or an Array containing "first" was []', matcher, []);
			assertMismatch('has property "length" with <3> property "length" was <1> or an Array containing "first" was ["second"]', matcher, ['second']);
			assertMismatch('has property "length" with <3> property "length" was <2> or an Array containing "first" was ["second","third"]', matcher, ['second', 'third']);
		}
    }
}