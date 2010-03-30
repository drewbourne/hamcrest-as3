package org.hamcrest.mxml.text
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.text.emptyString;

    /**
     * MXML wrapper for EmptyStringMatcher.
     *
     * @see org.hamcrest.text#emptyString()
     * @see org.hamcrest.text.EmptyStringMatcher
     *
     * @author Drew Bourne
     */
    public class EmptyString extends BaseMXMLMatcher
    {
        /**
         * Constructor. 
         */
        public function EmptyString()
        {
            super();
            
            // as we have no property changes we force a call to commitProperties 
            // in order to initialize the description
            commitProperties();
        }
        
        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return emptyString();
        }
    }
}