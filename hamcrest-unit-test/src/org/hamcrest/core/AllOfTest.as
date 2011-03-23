package org.hamcrest.core
{
    import flexunit.framework.*;
    
    import org.hamcrest.AbstractMatcherTestCase;
    import org.hamcrest.Matcher;
    import org.hamcrest.assertThat;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.hasProperty;
    import org.hamcrest.object.notNullValue;

    public class AllOfTest extends AbstractMatcherTestCase
    {
        [Test]
        public function evaluatesToTheTheLogicalConjunctionOfTwoOtherMatchers():void
        {
            assertThat("good", allOf(equalTo("good"), equalTo("good")));

            assertThat("good", not(allOf(equalTo("bad"), equalTo("good"))));
            assertThat("good", not(allOf(equalTo("good"), equalTo("bad"))));
            assertThat("good", not(allOf(equalTo("bad"), equalTo("bad"))));
        }

        [Test]
        public function evaluatesToTheTheLogicalConjunctionOfManyOtherMatchers():void
        {
            assertThat("good", allOf(equalTo("good"), equalTo("good"), equalTo("good"), equalTo("good"),
                equalTo("good")));
            assertThat("good", not(allOf(equalTo("good"), equalTo("good"), equalTo("bad"), equalTo("good"),
                equalTo("good"))));
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("(\"good\" and \"bad\" and \"ugly\")",
                allOf(equalTo("good"), equalTo("bad"), equalTo("ugly")));
        }

        [Test]
        public function mismatchDescriptionDescribesFirstFailingMatch():void
        {
            assertMismatch("\"good\" was \"bad\"", allOf(equalTo("bad"), equalTo("good")), "bad");
        }
		
		[Test]
		public function mismatchDescriptionShouldIncludeMismatchDescriptionFromMismatchedMatchers():void 
		{
			var matcher:Matcher = allOf(notNullValue(), hasProperty("length", 3), hasItem("first"));
			
			assertMismatch('not null was null', matcher, null);
			assertMismatch('has property "length" with <3> property "length" was <0>', matcher, []);
			assertMismatch('has property "length" with <3> property "length" was <1>', matcher, ['first']);
			assertMismatch('has property "length" with <3> property "length" was <2>', matcher, ['first', 'second']);
			assertMismatch('has property "length" with <3> property "length" was <2>', matcher, ['second', 'third']);
			assertMismatch('an Array containing "first" was ["second","third","fourth"]', matcher, ['second', 'third', 'fourth']);
		}
    }
}