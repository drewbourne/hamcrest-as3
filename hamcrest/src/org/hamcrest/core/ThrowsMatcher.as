package org.hamcrest.core
{
    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.TypeSafeDiagnosingMatcher;

    /**
     * Matches if the item under test is a Function, and throws an Error matching the given Matcher.
     *
     * @see org.hamcrest.core#throws()
     *
     * @example
     * <listing version="3.0">
     *  assertThat(function():void {
     *      systemUnderTest.methodCall(given, bad, args);
     *  }, throws(allOf(
     *      instanceOf(OhNoItsAnError),
     *      hasPropertyWithValue("message", "oh no"))));
     * </listing>
     *
     * @author Drew Bourne
     */
    public class ThrowsMatcher extends TypeSafeDiagnosingMatcher
    {
        private var _matcher:Matcher;

        /**
         * Constructor.
         *
         * @param matcher Matcher to match the thrown error with.
         */
        public function ThrowsMatcher(matcher:Matcher)
        {

            super(Function);
            _matcher = matcher;
        }

        /**
         * @inheritDoc
         */
        override public function matchesSafely(item:Object, mismatchDescription:Description):Boolean
        {
            var fn:Function = item as Function;
            var thrown:Boolean = false;
            var error:Error = null;

            try
            {
                fn();
            }
            catch (e:Error)
            {
                error = e;
                if (_matcher.matches(e))
                {
                    thrown = true;
                }
                else
                {
                    throw e;
                }
            }
            finally
            {
                if (error)
                {
                    mismatchDescription.appendMismatchOf(_matcher, error);
                }
                else
                {
                    mismatchDescription.appendText("was not thrown");
                }

                return thrown;
            }
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void
        {
            description.appendDescriptionOf(_matcher).appendText(" to be thrown");
        }
    }
}
