package org.hamcrest
{
    import org.hamcrest.collection.EveryByMatcherTest;
    import org.hamcrest.collection.EveryTest;
    import org.hamcrest.collection.FilterByMatcherTest;
    import org.hamcrest.collection.InArrayTest;
    import org.hamcrest.collection.IndexOfByMatcherTest;
    import org.hamcrest.collection.IndexesOfByMatcherTest;
    import org.hamcrest.collection.IsArrayContainingTest;
    import org.hamcrest.collection.IsArrayTest;
    import org.hamcrest.collection.IsArrayWithSizeTest;
    import org.hamcrest.collection.RejectByMatcherTest;
    import org.hamcrest.collection.SomeByMatcherTest;
    import org.hamcrest.collection.SortedByFieldsTest;
    import org.hamcrest.collection.SortedByTest;
    import org.hamcrest.core.AllOfTest;
    import org.hamcrest.core.AnyOfTest;
    import org.hamcrest.core.CombinableTest;
    import org.hamcrest.core.DescribedAsTest;
    import org.hamcrest.core.EvaluateTest;
    import org.hamcrest.core.GivenTest;
    import org.hamcrest.core.IsAnythingTest;
    import org.hamcrest.core.IsNotTest;
    import org.hamcrest.core.IsNothingTest;
    import org.hamcrest.core.ThrowsTest;
    import org.hamcrest.date.DateAfterTest;
    import org.hamcrest.date.DateBeforeTest;
    import org.hamcrest.date.DateBetweenTest;
    import org.hamcrest.date.DateEqualTest;
    import org.hamcrest.filter.FilterFunctionTest;
    import org.hamcrest.mxml.object.NotNullTest;
    import org.hamcrest.number.AtLeastTest;
    import org.hamcrest.number.AtMostTest;
    import org.hamcrest.number.BetweenTest;
    import org.hamcrest.number.CloseToTest;
    import org.hamcrest.number.GreaterThanTest;
    import org.hamcrest.number.IsNotANumberTest;
    import org.hamcrest.number.IsNumberTest;
    import org.hamcrest.number.LessThanTest;
    import org.hamcrest.object.HasPropertiesTest;
    import org.hamcrest.object.HasPropertyChainTest;
    import org.hamcrest.object.HasPropertyTest;
    import org.hamcrest.object.HasPropertyWithValueTest;
    import org.hamcrest.object.IsEqualTest;
    import org.hamcrest.object.IsFalseTest;
    import org.hamcrest.object.IsInstanceOfTest;
    import org.hamcrest.object.IsInterfaceTest;
    import org.hamcrest.object.IsNotNullTest;
    import org.hamcrest.object.IsNullTest;
    import org.hamcrest.object.IsSameTest;
    import org.hamcrest.object.IsStrictlyEqualTest;
    import org.hamcrest.object.IsTrueTest;
    import org.hamcrest.object.NullOrMatcherTest;
    import org.hamcrest.text.ContainsStringsTest;
    import org.hamcrest.text.EmptyStringTest;
    import org.hamcrest.text.StringContainsTest;
    import org.hamcrest.text.StringEndsWithTest;
    import org.hamcrest.text.StringStartsWithTest;
    import org.hamcrest.validation.MatcherValidatorTest;
    
    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class HamcrestSuite
    {
		public var assertThatTest:AssertThatTest;
        public var baseMatcher:BaseMatcherTest;
        public var customMatcher:CustomMatcherTest;
        public var customTypeSafeMatcher:CustomTypeSafeMatcherTest;
        public var matcherAssert:MatcherAssertTest;
        public var typeSafeMatcher:TypeSafeMatcherTest;
        
        // core
        public var allOf:AllOfTest;
        public var anyOf:AnyOfTest;
        public var combinable:CombinableTest;
        public var describedAs:DescribedAsTest;
        public var evaluate:EvaluateTest;
        public var given:GivenTest;
        public var every:EveryTest;
        public var anything:IsAnythingTest;
		public var nothing:IsNothingTest;
        public var not:IsNotTest;
        
        // collection
        public var array:IsArrayTest;
        public var arrayWithSize:IsArrayWithSizeTest;
        public var arrayContaining:IsArrayContainingTest;
        public var inArray:InArrayTest;
        public var sortedBy:SortedByTest;
        public var sortedByFields:SortedByFieldsTest;
        
        // number
        public var between:BetweenTest;
        public var closeTo:CloseToTest;
        public var greaterThan:GreaterThanTest;
        public var lessThan:LessThanTest;
		public var isNumber:IsNumberTest;
		public var isNotANumber:IsNotANumberTest;
		public var atLeast:AtLeastTest;
		public var atMost:AtMostTest;
        
        // object
		public var hasProperties:HasPropertiesTest;
        public var hasProperty:HasPropertyTest;
        public var hasPropertyWithValue:HasPropertyWithValueTest;
        public var hasPropertyChain:HasPropertyChainTest;
        public var equalTo:IsEqualTest;
        public var instanceOf:IsInstanceOfTest;
        public var sameInstance:IsSameTest;
        public var strictlyEqualTo:IsStrictlyEqualTest;
        public var isTrue:IsTrueTest;
        public var isFalse:IsFalseTest;
		public var isNull:IsNullTest;
		public var isNotNull:IsNotNullTest;
		public var isInterface:IsInterfaceTest;
        public var nullOr:NullOrMatcherTest;
        
        // text
        public var stringContains:StringContainsTest;
        public var stringEndsWith:StringEndsWithTest;
        public var stringStarteWith:StringStartsWithTest;
        public var emptyString:EmptyStringTest;
		public var containsStrings:ContainsStringsTest;
        
        // extras
        public var throws:ThrowsTest;
        
        // date
        public var dateBetween:DateBetweenTest;
        public var dateAfter:DateAfterTest;
        public var dateBefore:DateBeforeTest;
        public var dateEqual:DateEqualTest;
        
        // mxml
        public var hamcrestMXML:HamcrestMXMLSuite;
        
        // extras / integration
        public var validator:MatcherValidatorTest;
        public var filterFunction:FilterFunctionTest;
		
		// collection extras
		public var everyByMatcher:EveryByMatcherTest;
		public var someByMatcher:SomeByMatcherTest;
		public var filterByMatcher:FilterByMatcherTest;
		public var rejectByMatcher:RejectByMatcherTest;
		public var indexOfByMatcher:IndexOfByMatcherTest;
		public var indexesOfByMatcher:IndexesOfByMatcherTest;
    }
}
