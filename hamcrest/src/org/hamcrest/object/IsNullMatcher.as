package org.hamcrest.object
{
    import org.hamcrest.BaseMatcher;
    import org.hamcrest.Description;

    /**
     * Matches if the item is <code>null</code>
     *
     * @see org.hamcrest.object.nullValue
     * @see org.hamcrest.object.notNullValue
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class IsNullMatcher extends BaseMatcher
    {
        /**
         * @inheritDoc
         */
        override public function matches(item:Object):Boolean
        {
            return item == null;
        }

        /**
         * @inheritDoc
         */
        override public function describeTo(description:Description):void
        {
            description.appendText("null");
        }
    }
}
