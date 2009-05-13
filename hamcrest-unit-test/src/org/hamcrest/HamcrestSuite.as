<<<<<<< HEAD:hamcrest-unit-test/src/org/hamcrest/HamcrestSuite.as
package org.hamcrest {
    import org.hamcrest.collection.EveryTest;
    import org.hamcrest.collection.IsArrayContainingTest;
    import org.hamcrest.collection.IsArrayTest;
    import org.hamcrest.collection.IsArrayWithSizeTest;
    import org.hamcrest.core.AllOfTest;
    import org.hamcrest.core.AnyOfTest;
    import org.hamcrest.core.CombinableTest;
    import org.hamcrest.core.DescribedAsTest;
    import org.hamcrest.core.IsAnythingTest;
    import org.hamcrest.core.IsNotTest;
    import org.hamcrest.core.ThrowsTest;
    import org.hamcrest.number.BetweenTest;
    import org.hamcrest.number.CloseToTest;
    import org.hamcrest.number.GreaterThanTest;
    import org.hamcrest.number.LessThanTest;
    import org.hamcrest.object.HasPropertiesTest;
    import org.hamcrest.object.HasPropertyTest;
    import org.hamcrest.object.HasPropertyWithValueTest;
    import org.hamcrest.object.IsEqualTest;
    import org.hamcrest.object.IsInstanceOfTest;
    import org.hamcrest.object.IsNullTest;
    import org.hamcrest.object.IsSameTest;
    import org.hamcrest.text.StringContainsTest;
    import org.hamcrest.text.StringEndsWithTest;
    import org.hamcrest.text.StringStartsWithTest;

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
=======
package org.hamcrest
{
	import org.hamcrest.collection.EveryTest;
	import org.hamcrest.collection.IsArrayContainingTest;
	import org.hamcrest.collection.IsArrayTest;
	import org.hamcrest.collection.IsArrayWithSizeTest;
	import org.hamcrest.core.AllOfTest;
	import org.hamcrest.core.AnyOfTest;
	import org.hamcrest.core.CombinableTest;
	import org.hamcrest.core.DescribedAsTest;
	import org.hamcrest.core.IsAnythingTest;
	import org.hamcrest.core.IsNotTest;
	import org.hamcrest.core.ThrowsTest;
	import org.hamcrest.date.DateAfterTest;
	import org.hamcrest.date.DateBeforeTest;
	import org.hamcrest.date.DateBetweenTest;
	import org.hamcrest.number.BetweenTest;
	import org.hamcrest.number.CloseToTest;
	import org.hamcrest.number.GreaterThanTest;
	import org.hamcrest.number.LessThanTest;
	import org.hamcrest.object.HasPropertyTest;
	import org.hamcrest.object.HasPropertyWithValueTest;
	import org.hamcrest.object.IsEqualTest;
	import org.hamcrest.object.IsInstanceOfTest;
	import org.hamcrest.object.IsNullTest;
	import org.hamcrest.object.IsSameTest;
	import org.hamcrest.text.StringContainsTest;
	import org.hamcrest.text.StringEndsWithTest;
	import org.hamcrest.text.StringStartsWithTest;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]

	public class HamcrestSuite
	{
		public var t1:BaseMatcherTest;
		public var t2:CustomMatcherTest;
		public var t3:CustomTypeSafeMatcherTest;
		public var t4:MatcherAssertTest;
		public var t5:TypeSafeMatcherTest;
		
		// core
		public var t6:AllOfTest;
		public var t7:AnyOfTest;
		public var t8:CombinableTest;
		public var t9:DescribedAsTest;
		public var t10:EveryTest;
		public var t11:IsAnythingTest;
		public var t12:IsNotTest;
		
		// collection
		public var t13:IsArrayTest;
		public var t14:IsArrayWithSizeTest;
		public var t15:IsArrayContainingTest;
		
		// number
		public var t16:BetweenTest;
		public var t17:CloseToTest;
		public var t18:GreaterThanTest;
		public var t19:LessThanTest;
		
		// object
		public var t20:HasPropertyTest;
		public var t21:HasPropertyWithValueTest;
		public var t22:IsEqualTest;
		public var t23:IsInstanceOfTest;
		public var t24:IsNullTest;
		public var t25:IsSameTest;
		
		// text
		public var t26:StringContainsTest;
		public var t27:StringEndsWithTest;
		public var t28:StringStartsWithTest;
		
		// extras
		public var t29:ThrowsTest;
		
		// date
		public var t30 : DateBetweenTest;
		public var t31 : DateAfterTest;
		public var t32 : DateBeforeTest;
		
>>>>>>> 3dbcd9641f5fb457c7b15a814e53c593482e5522:hamcrest-unit-test/src/org/hamcrest/HamcrestSuite.as

    public class HamcrestSuite {
        public var base:BaseMatcherTest;
        public var custom:CustomMatcherTest;
        public var customTypeSafe:CustomTypeSafeMatcherTest;
        public var matcherAssert:MatcherAssertTest;
        public var typesSafe:TypeSafeMatcherTest;

        // core
        public var allOf:AllOfTest;
        public var anyOf:AnyOfTest;
        public var combinable:CombinableTest;
        public var describedAs:DescribedAsTest;
        public var every:EveryTest;
        public var anything:IsAnythingTest;
        public var not:IsNotTest;

        // collection
        public var array:IsArrayTest;
        public var arrayWithSize:IsArrayWithSizeTest;
        public var arrayContaining:IsArrayContainingTest;

        // number
        public var between:BetweenTest;
        public var closeTo:CloseToTest;
        public var greaterThan:GreaterThanTest;
        public var lessThan:LessThanTest;

        // object
        public var hasPropertiesTest:HasPropertiesTest;
        public var hasProperty:HasPropertyTest;
        public var hasPropertyWithValue:HasPropertyWithValueTest;
        public var equalTo:IsEqualTest;
        public var instanceOf:IsInstanceOfTest;
        public var nullValule:IsNullTest;
        public var sameInstance:IsSameTest;

        // text
        public var stringContains:StringContainsTest;
        public var stringEndWith:StringEndsWithTest;
        public var stringStartsWith:StringStartsWithTest;

        // extras
        public var throws:ThrowsTest;

    }
}