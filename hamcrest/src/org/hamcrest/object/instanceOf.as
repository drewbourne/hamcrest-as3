package org.hamcrest.object {

    import org.hamcrest.Matcher;

    public function instanceOf(type:Class):Matcher {
        return new IsInstanceOfMatcher(type);
    }
}
