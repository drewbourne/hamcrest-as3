package org.hamcrest.object {

    import org.hamcrest.*;
    import org.hamcrest.core.not;

    public class IsNullTest extends AbstractMatcherTestCase {

        public function testEvaluatesToTrueIfArgumentIsNull():void {

            assertThat(null, nullValue());
            assertThat("not null", not(nullValue()));

            // just use not(nullValue()) please
            // assertThat("not null", notNullValue());
            // assertThat(null, not(notNullValue()));
        }
    }
}
