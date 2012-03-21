package org.hamcrest.object
{
    import org.hamcrest.*;
    import org.hamcrest.core.not;

    public class IsNullTest extends AbstractMatcherTestCase
    {
        [Test]
        public function evaluatesToTrueIfArgumentIsNull():void
        {
            assertThat(null, nullValue());
            assertThat("not null", not(nullValue()));
            
            assertThat("not null", notNullValue());
            assertThat(null, not(notNullValue()));
        }
        
        [Test]
        public function isNull_matchingNull_shouldBeTrue():void 
        {
			assertMatches("null should match", isNull(), null);
        }
        
        [Test]
        public function isNull_matchingUndefined_shouldBeTrue_asCoercionRulesConvertUndefinedToNull():void 
        {
			assertMatches("undefined should match", isNull(), undefined);
        }
        
        [Test]
        public function isNull_matchingObject_shouldBeFalse():void 
        {
            assertDoesNotMatch("Object should not match", isNull(), {});
        }
        
        [Test]
        public function isNull_matchingArray_shouldBeFalse():void 
        {
			assertDoesNotMatch("Array", isNull(), []);
        }
        
        [Test]
        public function isNull_matchingBoolean_shouldBeFalse():void 
        {
			assertDoesNotMatch("Boolean should not match", isNull(), true);
        }
    }
}
