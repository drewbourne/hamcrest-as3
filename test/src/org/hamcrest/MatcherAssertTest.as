package org.hamcrest {

  import flexunit.framework.TestCase;
  
  public class MatcherAssertTest extends TestCase {
    
    public function testIncludesDescriptionOfTestedValueInErrorMessage():void {
      
      var expected:String = "expected";
      var actual:String = "actual";
      var expectedMessage:String = "identifier\nExpected: \"expected\"\n    but: was \"actual\"";
      
      try {
        assertThat("identifier", actual, equalTo(expected));
        fail("should have failed");
      } catch (error:AssertionError) {
        trace("testIncludesDescriptionOfTestedValueInErrorMessage");
        trace(">", error.message);
        assertTrue(startsWith(expectedMessage).matches(error.message));
      }
    }
    
    public function testDescriptionCanBeElided():void {
      
      var expected:String = "expected";
      var actual:String = "actual";
      var expectedMessage:String = "\nExpected: \"expected\"\n    but: was \"actual\"";
      
      try {
        assertThat(actual, equalTo(expected));
        fail("should have failed");
      } catch (error:AssertionError) {
        trace("testDescriptionCanBeElided")
        trace(">", error.message);
        trace(startsWith(expectedMessage).matches(error.message));
        
        assertTrue(startsWith(expectedMessage).matches(error.message));
      }
    }
    
    public function testCanTestBooleanDirectly():void {
      
      assertThat("success reason message", true);
      
      try {
        assertThat("failing reason message", false);
        fail("should have failed");
      } catch (error:AssertionError) {
        assertEquals("failing reason message", error.message);
      }
    }
    
    public function tetIncludedsMismatchDescription():void {
      
      var matcher:Matcher = new MatcherForTestingAssertThat();
      var expectedMessage:String = "\nExpected: something cool\n    but: was: not cool"
      
      try {
        assertThat("value", matcher);
        fail("should have failed");
      } catch (error:AssertionError) {
        assertEquals(expectedMessage, error.message);
      }
    }
  }
}

import org.hamcrest.BaseMatcher;
import org.hamcrest.Description;

internal class MatcherForTestingAssertThat extends BaseMatcher {
  
  override public function matches(item:Object):Boolean {
    return false;
  }
  
  override public function describeTo(description:Description):void {
    description.appendText("something cool");
  }
  
  override public function describeMismatch(item:Object, mismatchDescription:Description):void {
    mismatchDescription.appendText("not cool");
  }
}
