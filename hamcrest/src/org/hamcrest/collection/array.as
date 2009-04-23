package org.hamcrest.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.object.equalTo;

    /**
     * Creates a Matcher that only matches if each of the matchers given are satisfied by the
     * element at the same index in the array that is being matched.
     *
     * Matcher will fail if the number of items in the array being matched does not equal the number
     * of matchers given to this Matcher.
     *
     * @param ...rest Matchers or values to be wrapped in equalTo
     *
     * @see org.hamcrest.collection.IsArrayMatcher
     * @example
     * <listing version="3.0">
     *  // explicit definition of matchers
     *  assertThat([1, 1.9, 4], array(equalTo(1), closeTo(2, 0.1), equalTo(4));
     *
     *  // implicit conversion to equalTo()
     *  assertThat([1, 1.9, 4], array(1, 2, 4));
     *  // fails as item at index 2 is not equal to 2
     *
     *  // must be the same length
     *  assertThat([1, 2], array(1, 2, 3));
     *  // fails as different lengths
     * </listing>
     */
    public function array(... rest):Matcher {

        var elementMatchers:Array = rest.map(function(item:Object, i:int, a:Array):Matcher {
                return item is Matcher ? item as Matcher : equalTo(item);
            });

        return new IsArrayMatcher(elementMatchers);
    }
}
