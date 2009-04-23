package org.hamcrest.text {

    import org.hamcrest.Matcher;

    public function containsString(substring:String):Matcher {
        return new StringContainsMatcher(substring);
    }
}
