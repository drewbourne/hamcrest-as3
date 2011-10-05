package org.hamcrest.core
{
    import flash.errors.IllegalOperationError;
    
    import org.hamcrest.*;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.hasProperties;
    import org.hamcrest.object.instanceOf;
    import org.hamcrest.object.isFalse;
    import org.hamcrest.text.containsString;

    public class ThrowsTest extends AbstractMatcherTestCase
    {
        [Test]
        public function rethrowsUnexpectedError():void
        {
            var fn:Function = function():void {
                throw new IllegalOperationError("unexpected error");
            };

            assertDoesNotMatch("", throws(ArgumentError), fn);
        }

        [Test]
        public function matchesIfFunctionThrowsExpectedError():void
        {
            var fn:Function = function():void {
                throw new ArgumentError("expected error");
            };

            assertMatches("", throws(ArgumentError), fn);
            assertMatches("", throws(Error), fn);
        }

        [Test]
        public function doesNotMatchesIfFunctionDoesNotThrowAnyError():void
        {
            var fn:Function = function():void {
                ; // don't throw an error
            };

            assertDoesNotMatch("", throws(ArgumentError), fn);
        }

        [Test]
        public function acceptsInstanceMethod():void
        {
            var complainer:Complainer = new Complainer();
            assertThat(complainer.complain, throws(Complaint))
        }
		
		[Test]
		public function calling_matches_then_describeMismatch_should_describe_error_thrown_by_closure():void 
		{
			// SerialComplainer throws errors with messages "Complaint 0", "Complaint 1", "Complaint 2" ...
			var complainer:SerialComplainer = new SerialComplainer();
			var matcher:Matcher = throws(hasProperties({ message: "Complaint 1" }));
			
			// invoke matches
			matcher.matches(complainer.complain);
			
			// describe mismatch, should use the same error was thrown for matches()
			var description:Description = new StringDescription();
			matcher.describeMismatch(complainer.complain, description);
			
			assertThat(description.toString(), equalTo('property "message" was "Complaint 0"'));
		}
    }
}

internal class Complaint extends Error
{
    public function Complaint(message:String = null)
    {
        super(message || "Complaint");
    }
}

internal class Complainer
{
    public function complain():void
    {
        throw new Complaint();
    }
}

internal class SerialComplainer
{
	private var index:int = 0;
	
	public function complain():void 
	{
		var complaintIndex:int = index++;
		
		throw new Complaint("Complaint " + complaintIndex);
	}
}
