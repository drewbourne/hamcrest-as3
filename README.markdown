# Hamcrest for ActionScript 3

Provides a library of matcher objects (also known as constraints or predicates) allowing 'match' rules to be defined declaratively, to be used in other frameworks. Typical scenarios include testing frameworks, mocking libraries and UI validation rules.

Description from [Hamcrest Project at Google Code](http://code.google.com/p/hamcrest/)

## Hamcrest in Tests

Hamcrest is used in combination with a method called assertThat(), providing a mechanism to create composite checks inline, in a simple and clear fashion.

    [Test]    
    public function shouldDemonstrateHamcrestInTests():void {
        var values:Array = [1, 2, 3, 4];
        assertThat(values, allOf(hasItem(equalTo(3)), hasItem(closeTo(5, 1)));
        // should pass
    }
    
The major advantage of using assertThat() and the Hamcrest matchers over traditional assertions such as assertTrue(), assertEquals() is the descriptive failure messages when a matcher (or combination of matchers) does not match succesfully. 
    
    [Test]
    public function shouldDemonstrateHamcrestDescriptions():void {
        var badValues:Array = [1, 2, 3, 7, 8, 9];
        assertThat(badValues, allOf(hasItem(equalTo(3)), hasItem(closeTo(5, 1)));
        // should fail with the message:
        // Expected: (an Array containing <3> and an Array containing a Number within <1> of <5>)
        //      but: was <7> differed by <2>
    }


## Hamcrest for MXML

Most of the Matchers have also been made usable in the Flex MXML context by wrapping them in a facade that collects and proxies the Matcher arguments. The declarative format of MXML allows the Matchers to be composed, used and bound to. 

    <AllOf id="numberMatcher" target="{ Number(numberInput.text) }">
        <NotNull />
        <AnyOf>
            <EqualTo value="17" />
            <CloseTo value="11" delta="0.3" />
            <Between min="1" max="9" />
        </AnyOf>
    </AllOf>

    <mx:TextInput id="numberInput" />
    <mx:Label text={ numberMatcher.description }"" />
    <mx:Label text={ numberMatcher.mismatchDescription }"" />
    <mx:Label text={ numberMatcher.matched }"" />

## Conditional Matching with Hamcrest

Hamcrest provides two core Matchers to support conditional expressions:

* evaluate - matches if a specified Boolean condition evaluates to true.
* given - matches a value or Matcher if a specified Boolean condition evaluates to true.

These matchers are most powerful in their MXML form, when used in combination with other Hamcrest's MXML tags where the condition property of an Evaluate or Given tag can be populated via MXML bindings.

Additionally, complex composition of matcher evaluations of different objects can be achieved by binding the <code>matched</code> property from one MXML Matcher into the <code>condition</code> property of an Evaluate or Given tag used in the definition of another MXML Matcher.  Using this approach, complex business rules can be described in a declarative form in MXML and bound to model state.

Because Hamcrest describes Matchers using a declarative style, conditional logic can not be expressed in the imperative style most familiar to ActionScript developers.

Instead, this imperative style conditional logic:
 
     if ( condition1 ) {
        matcher1();
    } else if ( condition2 ) {
        matcher2();
    } else {
        matcher3();
    }
 
can be realized in a functional / declarative style as:
 
       ( condition1 and matcher1() ) 
    or
       ( condition2 and matcher2() ) 
    or
       ( matcher3() )
 
(due to the short circuit nature of 'and' and 'or') 
 
and expressed using Hamcrest Matchers as:
 
    anyOf( 
        allOf( 
            evaluate( condition1 ), 
            matcher1() 
        ), 
        allOf( 
            evaluate( condition2 ), 
            matcher2() 
        ), 
        matcher3() 
    );
 
or using Hamcrest Matcher MXML tags as:
 
    <AnyOf>
        <AllOf>
            <Evaluate condition="{ condition1 }" />
            <Matcher1 />
        </AllOf>
        <AllOf>
            <Evaluate condition="{ condition2 }" />
            <Matcher2 />
        </AllOf>
        <Matcher3 />
    </AnyOf> 		
 
(where condition1 and condition2 are valid Boolean expressions and Matcher3, Matcher2 and Matcher3 are valid Matcher tags).

## Validating with Hamcrest

The MXML Matchers can be combined with the MatcherValidator to provide a very flexible and declarative way to define validation for UIComponents and other objects without additional ActionScript.  

    <MatcherValidator id="validator" xmlns="http://hamcrest.org/2009/mxml">
      <AllOf>
        <ContainsString string="Win" />
        <HasProperty property="length">
          <GreaterThan value="3" />
        </HasProperty>
      </AllOf>
    <MatcherValidtor>

## Filtering with Hamcrest

The MXML Matchers can be combined with FilterFunction to provide a very flexible and declarative way to define complex conditional filter functions for use with ICollectionViews (ArrayCollection, XMLListCollection, ListCollectionView, HierarchicalCollectionView, etc.).

FilterFunction implements IFilterFunction and defines a filter function that enforces the specified Matcher.

    <FilterFunction>
        <AllOf>
            <HasProperty property="OS">
                <ContainsString string="Win" />
                <HasProperty property="length">
                    <GreaterThan value="3" />
                </HasProperty>
            </HasProperty>
        </AllOf>
    </FilterFunction>

FilterFunctions become more powerful when combined with conditional matchers:

    <FilterFunction id="enabledFilterFunctions">
        <AllOf>
            <Given condition="{ nameCheckBox.selected }" otherwise="true">
                <HasProperty property="name">
                    <ContainsString string="{ nameInput.text }" />
                </HasProperty>
            </Given>
            <Given condition="{ addressCheckBox.selected }" otherwise="true">
                <HasProperty property="address">
                    <ContainsString string="{ addressInput.text }" />
                </HasProperty>
            </Given>
        </AllOf>
    </FilterFunction>
    
Example of applying the resulting filter function to a collection view:

    <mx:Script>
        <![CDATA[

            protected function applyFilter():void
            {
                companies.filterFunction = enabledFilterFunctions.filterFunction;
                companies.refresh();
            }
            
        ]]>
    </mx:Script>

    <mx:ArrayCollection id="companies">
        <mx:Array>
            <mx:Object name="Adobe Systems Inc." address="345 Park Ave., San Jose, CA 95110-2704" />
            <mx:Object name="Apple Inc." address="1 Infinite Loop, Cupertino, CA 95014" />
            <mx:Object name="Google Inc." address="1600 Amphitheatre Parkway, Mountain View, CA 94043" />
            <mx:Object name="Microsoft Corporation" address="One Microsoft Way, Redmond, WA 98052-6399" />
        </mx:Array>
    </mx:ArrayCollection>
    
    <FilterFunction id="enabledFilterFunctions">
        <AllOf>
            <Given condition="{ nameCheckBox.selected }" otherwise="true">
                <HasProperty property="name">
                    <ContainsString string="{ nameInput.text }" />
                </HasProperty>
            </Given>
            <Given condition="{ addressCheckBox.selected }" otherwise="true">
                <HasProperty property="address">
                    <ContainsString string="{ addressInput.text }" />
                </HasProperty>
            </Given>
        </AllOf>
    </FilterFunction>
    
    <mx:Panel
        width="640" height="480">
        
        <mx:DataGrid 
            width="100%" height="100%"
            dataProvider="{ companies }">
            <mx:columns>
                <mx:DataGridColumn headerText="Name" dataField="name" />
                <mx:DataGridColumn headerText="Address" dataField="address" />
            </mx:columns>
        </mx:DataGrid>
        
        <mx:Form>
            <mx:FormItem label="Name" direction="horizontal">
                <mx:CheckBox id="nameCheckBox" />
                <mx:TextInput id="nameInput" enabled="{ nameCheckBox.selected }" />
            </mx:FormItem>
            <mx:FormItem label="Address" direction="horizontal">
                <mx:CheckBox id="addressCheckBox" />
                <mx:TextInput id="addressInput" enabled="{ addressCheckBox.selected }" />
            </mx:FormItem>
        </mx:Form>
        
        <mx:Button label="Apply" click="applyFilter()" />
        
    </mx:Panel>

## Commonly Used Functions

Here is an example test case, which shows off some commonly used functions:

    [Test]
    public void testBiscuit():void {
        var biscuit:Biscuit = new Biscuit("Ginger");
        assertThat(biscuit, hasProperty("chocolateChipCount", equalTo(10)));
        assertThat(biscuit.ingredients, hasProperties({"sugar": closeTo(1.5, 1),
                                                       "ginger": greaterThan(2),
                                                       "eggs": 2 })
        assertThat(biscuit.cookingTime, equalTo(10));
        assertThat(biscuit.isDelicious);
    }

## A Tour of Common Matchers

Hamcrest comes with a library of useful matchers. Here are some of the most important ones.

* Core
    * anything - always matches, useful if you don't care what the object under test is
    * describedAs - decorator to adding custom failure description
    * evaluate - matches if a specified Boolean condition evaluates to true.
    * given - conditionally matches a value or Matcher 
    * isA - matches a specific type
    * throws - matches if a function throws the given exception

* Logical
    * allOf - matches if all matchers match, short circuits (like &&)
    * anyOf - matches if any matchers match, short circuits (like ||)
    * not - matches if the wrapped matcher doesn't match and vice versa

* Object
    * equalTo - compares objects using ==
    * sameInstance, strictlyEqualTo - compare objects using ===
    * hasProperty - checks that a property exists and, optionally, that it matches the provided matcher
    * hasProperties - similar to hasProperty, but accepts a dictionary of properties and their associated matchers
    * instanceOf - test type
    * notNullValue, nullValue - test for null
    
* Collections
    * array - test an array's elements against an array of matchers
    * arrayWithSize - match an array's size against a number
    * hasItem, hasItems - test a collection contains elements
    * everyItem - test that a matcher matches every item in an array

* Number
    * closeTo - test that values are close to a given value
    * greaterThan, greaterThanOrEqualTo, lessThan, lessThanOrEqualTo - test ordering
    * between - test that a value is between two given values

* Text
    * containsString, endsWith, startsWith - test string matching
    * re - text matches a regular expression

* Date
    * dateAfter, dateAfterOrEqual, dateBefore,  dateBeforeOrEqual - date comparisons
    * dateBetween - test that a date is within a given range
    * dateEqual - tests dates for equality

## More Info

[Source](http://github.com/drewbourne/hamcrest-as3)
[Downloads](http://github.com/drewbourne/hamcrest-as3/downloads)
[Issues](http://github.com/drewbourne/hamcrest-as3/issues)
[Wiki](http://wiki.github.com/drewbourne/hamcrest-as3)
