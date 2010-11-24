package org.hamcrest.validator
{
    import mx.validators.ValidationResult;
    import mx.validators.Validator;
    
    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.StringDescription;
    
    [DefaultProperty("matcher")]
    
    /**
     * Flex Validator that uses Matchers for validation and errorString.
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:MatcherValidator
     *      id="exampleMatcherValidator"
     *      source="{ textInput }"
     *      property="text"&gt;
     *      &lt;hc:AllOf&gt;
     *          &lt;hc:NotNull /&gt;
     *          &lt;hc:StartsWith string="Ham" /&gt;
     *          &lt;hc:StringLength min="3" max="10" /&gt;
     *      &lt;hc:AllOf&gt;
     *  &lt;hc:MatcherValidator&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class MatcherValidator extends Validator
    {
        private var _matcher:Matcher;
        private var _errorCode:String;
        private var _errorMessage:String;
        
        /**
         * Constructor.
         */
        public function MatcherValidator()
        {
            super();
            
            _errorCode = "matcher.mismatch";
            _errorMessage = "Expected {0} but was {1}";
        }
        
	    [Bindable]
        /**
         * Matcher to validate value with.
         */
        public function get matcher():Matcher
        {
            return _matcher;
        }
        
        public function set matcher(value:Matcher):void
        {
            _matcher = value;
        }
        
	    [Bindable]
        /**
         * Error code string to use for invalid ValidationResult.
         */
        public function get errorCode():String
        {
            return _errorCode;
        }
        
        public function set errorCode(value:String):void
        {
            _errorCode = value;
        }
        
	    [Bindable]
        /**
         * Description of the mismatch to use for invalid ValidationResult.
         */
        public function get errorMessage():String
        {
            return _errorMessage;
        }
        
        public function set errorMessage(value:String):void
        {
            _errorMessage = value;
        }
        
        /**
         * Matches the value with the Matcher, describes the mismatch to a ValidationResult if value does not match.
         */
        override protected function doValidation(value:Object):Array
        {
            var results:Array = super.doValidation(value);
            
            if (matcher)
            {
                var result:ValidationResult = null;
                var matched:Boolean = matcher.matches(value);
                var matcherDescription:String;
                if (!matched)
                {
                    matcherDescription = StringDescription.toString(matcher);
                    result = new ValidationResult(true, '', errorCode, errorMessage || matcherDescription);
                    results.push(result);
                }
            }
            
            return results;
        }
    }
}
