package org.hamcrest.collection {

    import org.hamcrest.Matcher;
    import org.hamcrest.object.equalTo;

    // TODO @asdoc hasItem
    /**
     *
     */
    public function hasItem(value:Object):Matcher {
        if (value is Matcher) {
            return new IsArrayContainingMatcher(value as Matcher);
        }
        else {
            return hasItem(equalTo(value));
        }
    }
}
