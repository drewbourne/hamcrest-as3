package org.hamcrest
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.fail;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;

	public class AssertThatTest
	{
		private var MATCHER:Matcher;
		private var MESSAGE:String;		
		private var MATCHING_VALUE:*;
		private var MISMATCHED_VALUE:*;
		private var EXPECTED_VALUE:*;
		
		private var MISMATCHED_BOOLEAN:Boolean;
		
		[Before]
		public function setup():void
		{
			MESSAGE = "EXAMPLE ERROR MESSAGE";
			MATCHING_VALUE = 4;
			MISMATCHED_VALUE = 3;
			EXPECTED_VALUE = 4;
			MATCHER = equalTo(EXPECTED_VALUE);
			
			MISMATCHED_BOOLEAN = false;
		}
		
		[Test]
		public function with_message_matching_value_and_matcher_should_match_matcher_without_error():void 
		{
			assertThat(MESSAGE, MATCHING_VALUE, MATCHER);
		}
		
		[Test]
		public function with_message_mismatched_value_and_matcher_should_throw_an_AssertionError():void 
		{
			try
			{
				assertThat(MESSAGE, MISMATCHED_VALUE, MATCHER);
				fail("expecting AssertionError");
			}
			catch (error:AssertionError)
			{
				if (error.value != MISMATCHED_VALUE)
					throw new Error("Expecting AssertionError.value to reference mismatched value <3> but was <" + error.value + '>');
				
				if (error.message.indexOf(MESSAGE) == -1)
					throw new Error("Expecting AssertionError.message to contain '" + MESSAGE + "', was: '" + error.message + "'");
				
				if (error.message.indexOf("Expected: <4>") == -1)
					throw new Error("Expecting AssertionError.message to contain matcher description '<4>'");
				
				if (error.message.indexOf("but: was <3>") == -1)
					throw new Error("Expecting AssertionError.message to contain mismatch description 'was: <3>' but was <" + error.message + ">");
				
				if (error.matcherDescription != "<4>")
					throw new Error("Expecting AssertionError.matcherDescription to contain matcher description 'is true' but was <" + error.matcherDescription + ">");
				
				if (error.mismatchDescription != "was <3>")
					throw new Error("Expecting AssertionError.mismatchDescription to contain mismatch description 'was <3>' but was <" + error.mismatchDescription + ">");
			}
		}
		
		[Test]
		public function with_message_matching_value_and_expected_value_should_wrap_value_in_equalTo_without_error():void 
		{
			assertThat(MESSAGE, MATCHING_VALUE, MATCHER);
		}
		
		[Test]
		public function with_message_mismatched_value_and_expected_value_should_wrap_value_in_equalTo_and_throw_error():void 
		{
			try
			{
				assertThat(MESSAGE, MISMATCHED_VALUE, EXPECTED_VALUE);
				fail("expecting AssertionError");
			}
			catch (error:AssertionError)
			{
				if (error.value != MISMATCHED_VALUE)
					throw new Error("Expecting AssertionError.value to reference mismatched value <false> but was <" + error.value + '>');
				
				if (error.message.indexOf(MESSAGE) == -1)
					throw new Error("Expecting AssertionError.message to contain '" + MESSAGE + "', was: '" + error.message + "'");
				
				if (error.message.indexOf("Expected: <4>") == -1)
					throw new Error("Expecting AssertionError.message to contain matcher description '<4>'");
				
				if (error.message.indexOf("but: was <3>") == -1)
					throw new Error("Expecting AssertionError.message to contain mismatch description 'was: <3>' but was <" + error.message + ">");
				
				if (error.matcherDescription != "<4>")
					throw new Error("Expecting AssertionError.matcherDescription to contain matcher description 'is true' but was <" + error.matcherDescription + ">");
				
				if (error.mismatchDescription != "was <3>")
					throw new Error("Expecting AssertionError.mismatchDescription to contain mismatch description 'was <3>' but was <" + error.mismatchDescription + ">");
			}
		}
			
		[Test]
		public function with_matching_value_and_matcher():void 
		{
			assertThat(MATCHING_VALUE, MATCHER);
		}
		
		[Test]
		public function with_mismatched_value_and_matcher():void 
		{
			try
			{
				assertThat(MISMATCHED_VALUE, EXPECTED_VALUE);
				fail("expecting AssertionError");
			}
			catch (error:AssertionError)
			{
				if (error.value != MISMATCHED_VALUE)
					throw new Error("Expecting AssertionError.value to reference mismatched value <3> but was <" + error.value + '>');
				
				if (error.message.indexOf(MESSAGE) != -1)
					throw new Error("Expecting AssertionError.message contains unexpected message '" + MESSAGE + "', was: '" + error.message + "'");
				
				if (error.message.indexOf("Expected: <4>") == -1)
					throw new Error("Expecting AssertionError.message to contain matcher description '<4>'");
				
				if (error.message.indexOf("but: was <3>") == -1)
					throw new Error("Expecting AssertionError.message to contain mismatch description 'was: <3>' but was <" + error.message + ">");
				
				if (error.matcherDescription != "<4>")
					throw new Error("Expecting AssertionError.matcherDescription to contain matcher description 'is true' but was <" + error.matcherDescription + ">");
				
				if (error.mismatchDescription != "was <3>")
					throw new Error("Expecting AssertionError.mismatchDescription to contain mismatch description 'was <3>' but was <" + error.mismatchDescription + ">");
			}
		}
		
		[Test]
		public function with_message_and_matching_boolean():void 
		{
			assertThat(MESSAGE, true);	
		}
		
		[Test]
		public function with_matching_boolean():void 
		{
			assertThat(true);	
		}
		
		[Test]
		public function with_message_mismatched_boolean_should_throw_an_AssertionError():void
		{
			try
			{
				assertThat(MESSAGE, MISMATCHED_BOOLEAN);
				fail("expecting AssertionError");
			}
			catch (error:AssertionError)
			{
				if (error.value != MISMATCHED_BOOLEAN)
					throw new Error("Expecting AssertionError.value to reference mismatched value <false> but was <" + error.value + '>');
				
				if (error.message != MESSAGE)
					throw new Error("Expecting AssertionError.message to contain '" + MESSAGE + "', was: '" + error.message + "'");
				
				if (error.matcherDescription)
					throw new Error("Expecting AssertionError.matcherDescription should be empty for Boolean match but was <" + error.matcherDescription + ">");
				
				if (error.mismatchDescription)
					throw new Error("Expecting AssertionError.mismatchDescription should be empty for Boolean match but was <" + error.mismatchDescription + ">");
			}
		}
		
		[Test]
		public function with_mismatched_boolean_should_throw_an_AssertionError():void
		{
			try
			{
				assertThat(MISMATCHED_BOOLEAN);
				fail("expecting AssertionError");
			}
			catch (error:AssertionError)
			{
				if (error.value != MISMATCHED_BOOLEAN)
					throw new Error("Expecting AssertionError.value to reference mismatched value <false> but was <" + error.value + '>');
				
				if (error.message != "")
					throw new Error("Expecting AssertionError.message contains unexpected message '" + MESSAGE + "', was: '" + error.message + "'");
				
				if (error.matcherDescription)
					throw new Error("Expecting AssertionError.matcherDescription should be empty for Boolean match but was <" + error.matcherDescription + ">");
				
				if (error.mismatchDescription)
					throw new Error("Expecting AssertionError.mismatchDescription should be empty for Boolean match but was <" + error.mismatchDescription + ">");
			}
		}
	}
}