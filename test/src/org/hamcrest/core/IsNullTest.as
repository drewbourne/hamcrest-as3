package org.hamcrest.core {
  
  import org.hamcrest.*;
  
  public class IsNullTest extends AbstractMatcherTestCase {
    
    public function testEvaluatesToTrueIfArgumentIsNull():void {
      
      assertThat(null, nullValue());
      assertThat("not null", not(nullValue()));
      
      assertThat("not null", notNullValue());
      assertThat(null, not(notNullValue()));
    }
  }
}