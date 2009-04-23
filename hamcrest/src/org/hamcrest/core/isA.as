package org.hamcrest.core {

    import org.hamcrest.Matcher;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.instanceOf;

    // TODO @example isA
    // TODO @asdoc isA
    /**
     *
     */
    public function isA(value:Object):Matcher {

        if (value is Class) {
            return isA(instanceOf(value as Class));
        }

        if (value is Matcher) {
            return new IsMatcher(value as Matcher);
        }

        return isA(equalTo(value));
    }
}
