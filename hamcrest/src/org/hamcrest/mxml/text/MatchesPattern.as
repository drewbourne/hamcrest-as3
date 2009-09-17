package org.hamcrest.mxml.text
{
    import flash.errors.IllegalOperationError;
    
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.re;
    
    /**
     * Dispatched when the <code>expression</code> property is changed.
     */
    [Event(name='expressionChanged',type='flash.events.Event')]
    
    /**
     * Dispatched when the <code>flags</code> property is changed.
     */
    [Event(name='flagsChanged',type='flash.events.Event')]
    
    // TODO asdoc example
    /**
     * MXML wrapper for RegExpMatcher.
     *
     * @see org.hamcrest.text#re()
     * @see org.hamcrest.text.RegExpMatcher
     *
     * @author Drew Bourne
     */
    public class MatchesPattern extends BaseMXMLMatcher
    {
        private var _expression:String;
        private var _flags:String;
        
        /**
         * Constructor.
         */
        public function MatchesPattern()
        {
            super();
        }
        
        /**
         * RegExp expression
         */
        [Bindable('expressionChanged')]
        public function get expression():String
        {
            return _expression;
        }
        
        public function set expression(value:String):void
        {
            _expression = value;
            changed('expression');
        }
        
        /**
         * RegExp flags
         */
        [Bindable('flagsChanged')]
        public function get flags():String
        {
            return _flags;
        }
        
        public function set flags(value:String):void
        {
            _flags = value;
            changed('flags');
        }
        
        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return re(new RegExp(expression, flags));
        }
    }
}
