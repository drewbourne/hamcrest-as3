package org.hamcrest.object
{
    import org.hamcrest.Matcher;
    import org.hamcrest.core.allOf;

    // TODO @example for hasProperties
    // TODO @asdoc for hasProperties
    /**
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public function hasProperties(object:Object):Matcher
    {
        var matchers:Array = [];
        for (var field:String in object)
        {
            var value:Object = object[field];
            var valueMatcher:Matcher = value is Matcher ? value as Matcher : equalTo(value);
            var propertyMatcher:Matcher = hasPropertyWithValue(field, valueMatcher);
            matchers.push(propertyMatcher);
        }

        // TODO determine if this is still the case
        // NB anonymous objects seem to be iterating their fields in reverse order
        return allOf.apply(null, matchers.reverse());
    }
}
