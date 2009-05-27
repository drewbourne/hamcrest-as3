# Hamcrest for ActionScript 3

Provides a library of matcher objects (also known as constraints or predicates) allowing 'match' rules to be defined declaratively, to be used in other frameworks. Typical scenarios include testing frameworks, mocking libraries and UI validation rules.

Description from [Hamcrest Project at Google Code](http://code.google.com/p/hamcrest/)

    [Test]    
    public function shouldDemonstrateHamcrestInTests():void {
        var values:Array = [1, 2, 3, 4];
        assertThat(values, allOf(hasItem(equalTo(3)), hasItem(closeTo(5, 1)));
        // should pass
    }


## Hamcrest for MXML

Most of the Matchers have also been made usable in the Flex MXML context by wrapping them in a façade that collects and proxies the Matcher arguments. The declarative format of MXML allows the Matchers to be composed, used and bound to. 

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

