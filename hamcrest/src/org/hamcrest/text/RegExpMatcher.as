package org.hamcrest.text
{
    import org.hamcrest.BaseMatcher;
    
    // FIXME asdoc for RegExpMatcher
    /**
     *
     */
    public class RegExpMatcher extends SubstringMatcher
    {
        private var _pattern:RegExp;
        
        /**
         * Constructor
         *
         * @param substring Substring to search for
         */
        public function RegExpMatcher(pattern:RegExp)
        {
            _pattern = pattern;
            
            super(_pattern.toString());
        }
        
        /**
         * @inheritDoc
         */
        override protected function evaluateSubstringOf(s:String):Boolean
        {
            return _pattern.test(s);
        }
        
        /**
         * @inheritDoc
         */
        override protected function relationship():String
        {
            return "matching";
        }
    }
}