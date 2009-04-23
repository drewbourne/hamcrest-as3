package org.hamcrest.object {

    import org.hamcrest.Matcher;

    public function sameInstance(value:Object):Matcher {
        return new IsSameMatcher(value);
    }
}
