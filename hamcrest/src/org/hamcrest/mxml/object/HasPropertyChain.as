package org.hamcrest.mxml.object
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcherComposite;
    import org.hamcrest.mxml.MXMLMatcher;
    import org.hamcrest.object.hasPropertyChain;

    /**
     * Dispatched when the <code>propertyChain</code> property is changed.
     */
    [Event(name='propertyChainChanged', type = 'flash.events.Event')]

    /**
     * Dispatched when the <code>value</code> property is changed.
     */
    [Event(name='valueChanged', type = 'flash.events.Event')]

    /**
     * Default property for MXML support. 
     */
    [DefaultProperty('value')]
    
    /**
     * MXML façade for hasPropertyChain() Matcher.
     *
     * @see org.hamcrest.object#hasPropertyChain()
     * @see org.hamcrest.object.HasPropertyChainMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:hasPropertyChain propertyChain="one.two.three" /&gt;
     *  &lt;hc:hasPropertyChain propertyChain="one.two.three" value="{ 4 }" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */    
    public class HasPropertyChain extends BaseMXMLMatcherComposite
    {
        private var _propertyChain:Object;
        private var _value:*;
        
        /**
         * Constructor. 
         */
        public function HasPropertyChain()
        {
            super();
        }
        
        [Bindable('propertyChanged')]
        /**
         * Property name target object must have.
         */
        public function get propertyChain():Object
        {
            return _propertyChain;
        }

        public function set propertyChain(val:Object):void
        {
            if (_propertyChain != val)
            {
                _propertyChain = val;
                changed('property');
            }
        }

        [Bindable('valueChanged')]
        /**
         * Value or Matcher for the expected value of the property
         */
        public function get value():*
        {
            return _value;
        }

        public function set value(val:*):void
        {
            if (_value != val)
            {
                _value = val;

                if (val && !(val is MXMLMatcher))
                {
                    var valueMatcher:EqualTo = new EqualTo();
                    valueMatcher.value = val;
                    val = valueMatcher;
                }

                if (val is MXMLMatcher)
                {
                    matcher = (val as MXMLMatcher);
                }

                changed('value');
            }
        }
         
        
        /**
         * Creates a HasPropertyChainMatcher
         * 
         * @see org.hamcrest.object.hasPropertyChain
         * @see org.hamcrest.object.HasPropertyChainMatcher 
         */
        override protected function createMatcher():Matcher
        {
            return hasPropertyChain(propertyChain, matcher ? matcher : value);
        }
    }
}