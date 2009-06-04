package org.hamcrest.collection
{
    import org.hamcrest.Matcher;
    import org.hamcrest.object.equalTo;

    /**
     * Checks the item being matched is an <code>Array</code> and has the expected number of items.
     *
     * @param size Number, int, uint in the range of >= 0.
     *
     * @see org.hamcrest.collection.IsArrayWithSizeMatcher
     * @example
     * <listing version="3.0">
     *  assertThat([], arrayWithSize(0));
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function arrayWithSize(size:Number):Matcher
    {
        if (size is Number || size is int || size is uint)
        {
            return new IsArrayWithSizeMatcher(equalTo(size));
        }
        else
        {
            throw new ArgumentError("Expecting Number, int, or uint for size, received:" + size);
        }
    }
}
