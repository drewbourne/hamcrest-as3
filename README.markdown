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

    <core:AllOf id="numberMatcher" target="{ Number(numberInput.text) }">
        <object:NotNull />
        <core:AnyOf>
            <object:EqualTo value="17" />
            <number:CloseTo value="11" delta="0.3" />
            <number:Between min="1" max="9" />
        </core:AnyOf>
    </core:AllOf>

    <mx:TextInput id="numberInput" />
    <mx:Label text={ numberMatcher.description }"" />
    <mx:Label text={ numberMatcher.mismatchDescription }"" />
    <mx:Label text={ numberMatcher.matched }"" />

