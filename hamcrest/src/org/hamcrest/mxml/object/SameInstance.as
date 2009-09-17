package org.hamcrest.mxml.object
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.sameInstance;

    /**
     * Dispatched when the <code>value</code> property is changed.
     */
    [Event(name='valueChanged', type = 'flash.events.Event')]

    /**
     * MXML façade for sameInstance() / IsSameMatcher.
     *
     * @see org.hamcrest.object#sameInstance()
     * @see org.hamcrest.object.IsSameMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:SameInstance value="{ anInstanceOfSomething }" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class SameInstance extends BaseMXMLMatcher
    {
        private var _value:*;

        /**
         * Constructor.
         */
        public function SameInstance()
        {
            super();
        }

        /**
         * Instnace the target value must be exactly equal to.
         */
        [Bindable('valueChanged')]
        public function get value():*
        {
            return _value;
        }

        public function set value(value:*):void
        {
            if (_value != value)
            {
                _value = value;
                changed('value');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return sameInstance(value);
        }
    }
}
