package org.hamcrest.object {

    import org.hamcrest.Matcher;

    public function nullValue():Matcher {
        return new IsNullMatcher();
    }
}
