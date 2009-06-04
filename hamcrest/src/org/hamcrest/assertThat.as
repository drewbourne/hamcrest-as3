package org.hamcrest
{

    /**
     * <code>assertThat</code> accepts four forms of arguments:
     *
     * <ul>
     * <li>String, Object, Matcher</li>
     * <li>Object, Matcher</li>
     * <li>String, Boolean (or Object)</li>
     * <li>Boolean (or Object)</li>
     * </ul>
     *
     * Where:
     * <ul>
     * <li>String if given is a description of the assertion, </li>
     * <li>Object is the value to assert, </li>
     * <li>Matcher is a Matcher instance to use, </li>
     * <li>Boolean is true or false, or an Object that can be coerced to Boolean. </li>
     * </ul>
     *
     * In the first two forms the Matcher will be called with the Object and if failed throw an <code>org.hamcrest.AssertionError</code>.
     *
     * In the second two forms the value of the Boolean will be used as the result, and if <code>false</code> will throw an <code>org.hamcrest.AssertionError</code>
     *
     * @example
     * <listing version="3.0">
     *    assertThat("PI should be near enough", Math.PI, closeTo(3.14, 0.1);
     *    assertThat(8/2, equalTo(4));
     *    assertThat("Math works", 1 * 2);
     *    assertThat({ value: "is not false-y" });
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function assertThat(... rest):void
    {
        if (rest.length == 3 && rest[2] is Matcher)
        {
            assertThatMatcher(rest[0], rest[1], rest[2]);
        }
        else if (rest.length == 2 && rest[1] is Matcher)
        {
            assertThatMatcher("", rest[0], rest[1])
        }
        else if (rest.length == 2)
        {
            assertThatBoolean(rest[0], Boolean(rest[1]));
        }
        else if (rest.length == 1)
        {
            assertThatBoolean("", Boolean(rest[0]));
        }
        else
        {
            throw new ArgumentError("Insufficient arguments or incorrect types, received:", rest);
        }
    }
}
