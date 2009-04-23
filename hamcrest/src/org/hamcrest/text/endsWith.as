package org.hamcrest.text {

    import org.hamcrest.Matcher;

    public function endsWith(substring:String):Matcher {
        return new StringEndsWithMatcher(substring);
    }
}
