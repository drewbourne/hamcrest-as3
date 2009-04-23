package org.hamcrest.text {

    import org.hamcrest.Matcher;

    public function startsWith(substring:String):Matcher {
        return new StringStartsWithMatcher(substring);
    }
}
