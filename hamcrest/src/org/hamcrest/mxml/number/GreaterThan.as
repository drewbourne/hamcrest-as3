package org.hamcrest.mxml.number
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.greaterThan;

    /**
     * MXML facade for the greaterThan() / IsGreaterThanMatcher.
     *
     * @see org.hamcrest.number#greaterThan()
     * @see org.hamcrest.number.IsGreaterThanMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:GreaterThan value="{ 4 }" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class GreaterThan extends BaseMXMLMatcher
    {

        private var _value:Number;

        /**
         * Constructor.
         */
        public function GreaterThan()
        {
            super();
        }

        /**
         * Number the target value must be greater than.
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
            return greaterThan(value);
        }
    }
}