package org.hamcrest.mxml.object
{

    import org.flexunit.assertThat;
    import org.hamcrest.mxml.AbstractMXMLMatcherTestCase;
    import org.hamcrest.mxml.object.EqualTo;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.nullValue;

    public class EqualToTest extends AbstractMXMLMatcherTestCase
    {

        /*
           <EqualTo value="3" target="{ someBindableValue }" />
         */

        [Test]
        public function hasDescription():void
        {
            var matcher:EqualTo = new EqualTo();
            matcher.value = 3;
            assertThat(matcher.description, "<3>");
        }

        [Test]
        public function matchedIsTrueIfTargetMatches():void
        {
            var matcher:EqualTo = new EqualTo();
            matcher.value = 3;
            matcher.target = 3;
            assertThat(matcher.matched, equalTo(true));
        }

        [Test]
        public function matchedIsFalseIFTargetDoesNotMatch():void
        {
            var matcher:EqualTo = new EqualTo();
            matcher.value = 3;
            matcher.target = 4;
            assertThat(matcher.matched, equalTo(false));
        }

        [Test]
        public function mismatchDescriptionIsNullIfTargetMatches():void
        {
            var matcher:EqualTo = new EqualTo();
            matcher.value = 3;
            matcher.target = 3;
            assertThat("mismatchDescription should be an empty string",
                matcher.mismatchDescription, equalTo(""));
        }

        [Test]
        public function mismatchDescriptionIsSetIfTargetDoesNotMatch():void
        {
            var matcher:EqualTo = new EqualTo();
            matcher.value = 3;
            matcher.target = 4;
            assertThat(matcher.mismatchDescription, equalTo("was <4>"));
        }
    }
}
