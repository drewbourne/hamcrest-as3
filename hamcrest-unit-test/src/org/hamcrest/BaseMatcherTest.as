package org.hamcrest {

    import flexunit.framework.TestCase;

    public class BaseMatcherTest extends TestCase {

        public function testDescribesItselfWithToStringMethod():void {

            var matcher:BaseMatcher = new BaseMatcherForTesting();
            assertEquals("SOME DESCRIPTION", matcher.toString());
        }
    }
}

import org.hamcrest.BaseMatcher;
import org.hamcrest.Description;

internal class BaseMatcherForTesting extends BaseMatcher {

    override public function describeTo(description:Description):void {
        description.appendText("SOME DESCRIPTION");
    }
}
