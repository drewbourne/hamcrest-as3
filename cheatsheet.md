# hamcrest as3 cheatsheet

## core

`anything()` 
matches any Object, any value. 

`describedAs(description:String, matcher:Matcher, ... values)` 
modifies the description of the given Matcher, optionally interpolates values.

`evalute(condition:Boolean)`
matches if a specified Boolean condition evaluates to true.

`given(condition:Boolean, valueOrMatcher:Object, otherwise:Boolean = false)`
conditionally matches a value or Matcher.

`throws(error:Error)`
`throws(error:Matcher)`
matches if the item under test is a Function, and throws an Error matching the given Matcher.

## logical

`allOf(...matchers)`
matches if an item matches all of the given Matchers.

`anyOf(...matchers)`
matches if the item being matched matches any of the given Matchers.

`not(matcher:Matcher)`
inverts the result of another Matcher or value.

## object

`equalTo(value:Object)`
matches if item being matched is equal  (`==`) to the given value.

`strictlyEqualTo(value:Object)`
matches if item being matched is strictly equal (`===`) to the given value.

`isTrue()`
matches item if it is strictly equal to `true`.

`isTruthy()`
matches if item when coerced to Boolean is equal to `true`.

`isFalse()`
matches item if it is strictly equal to `false`.

`isFalsey()`
matches if item when coerced to Boolean is equal to `false`.

`hasProperty(property:String)`
matches if `property in item`.

`hasProperty(property:String, value:Object)`
matches if `property in item` and the value of that property is `equalTo(value)`. 

`hasProperty(property:String, value:Matcher)`
matches if `property in item` and the value of that property matches the value. 

`hasProperties(object:Object)`
matches if item has all the properties and matching values.

`hasPropertyChain(chain:String, value:Object)`
`hasPropertyChain(chain:String, value:Matcher)`
matches an object with properties for each link in the given property chain, optionally checking for an expected value.

`instanceOf(class:Class)`
matches if the item is an instance of the given type.

`nullValue()`
matches item if `== null`.

`notNullValue()`
matches item if `!= null`.

## collections



## numbers

## strings

## dates