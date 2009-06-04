package org.hamcrest.mxml.object
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.object.instanceOf;

    /**
     * Dispatched when the <code>type</code> property is changed.
     */
    [Event(name='typeChanged', type = 'flash.events.Event')]

    /**
     * MXML façade for instanceOf() / IsInstanceOfMatcher.
     *
     * @see org.hamcrest.object.instanceOf
     * @see org.hamcrest.object.IsInstanceOfMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:InstanceOf type="{ CustomClass }" />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class InstanceOf extends BaseMXMLMatcher
    {
        private var _type:Class;

        /**
         * Constructor.
         */
        public function InstanceOf()
        {
            super();
        }

        /**
         * Class the target value must be an instance of.
         */
        [Bindable('typeChanged')]
        public function get type():Class
        {
            return _type;
        }

        public function set type(value:Class):void
        {
            if (_type != value)
            {
                _type = value;
                changed('type');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return instanceOf(type);
        }
    }
}
