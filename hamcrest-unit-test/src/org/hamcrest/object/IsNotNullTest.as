package org.hamcrest.object
{
    import org.hamcrest.*;
    import org.hamcrest.core.not;

    public class IsNotNullTest extends AbstractMatcherTestCase
    {
        [Test]
        public function evaluatesToTrueIfArgumentIsNotNull():void
        {
            assertThat("not null", not(nullValue()));
            assertThat("not null", notNullValue());
        }
        
        [Test]
        public function isNotNull_matchingNull_shouldBeFalse():void 
        {
            assertDoesNotMatch("null should match", isNotNull(), null);
        }
        
        [Test]
        public function isNotNull_matchingUndefined_shouldBeFalse():void 
        {
			assertDoesNotMatch("undefined should not match", isNotNull(), undefined);
        }
        
        [Test]
        public function isNotNull_matchingObject_shouldBeTrue():void 
        {
            assertMatches("Object should not match", isNotNull(), {});
        }
        
        [Test]
        public function isNotNull_matchingArray_shouldBeTrue():void 
        {
            assertMatches("Array", isNotNull(), []);
        }
        
        [Test]
        public function isNotNull_matchingBoolean_shouldBeTrue():void 
        {
            assertMatches("Boolean should not match", isNotNull(), true);
        }
    }
}
