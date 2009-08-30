package org.hamcrest.mxml.number
{

    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.lessThan;

    /**
     * MXML facade for the lessThan() / IsLessThanMatcher.
     *
     * @see org.hamcrest.number.lessThan
     * @see org.hamcrest.number.IsLessThanMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:LessThan value="{ 4 }" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class LessThan extends BaseMXMLMatcher
    {
        private var _value:Number;

        /**
         * Constructor.
         */
        public function LessThan()
        {
            super();
        }

        /**
         * Number the target value must be less than.
         */
        [Bindable('valueChanged')]
        public function get value():Number
        {
            return _value;
        }

        public function set value(value:Number):void
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
            return lessThan(value);
        }
    }
}