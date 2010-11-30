package org.hamcrest.mxml.number
{
    import org.hamcrest.Matcher;
    import org.hamcrest.mxml.BaseMXMLMatcher;
    import org.hamcrest.number.lessThanOrEqualTo;

    /**
     * MXML facade for the lessThanOrEqualTo() / IsLessThanMatcher.
     *
     * @see org.hamcrest.number#lessThanOrEqualTo()
     * @see org.hamcrest.number.IsLessThanMatcher
     *
     * @example
     * <listing version="3.0">
     *  &lt;hc:LessThanOrEqualTo value="{ 4 }" /&gt;
     * </listing>
     *
     * @author Drew Bourne
     */
    public class LessThanOrEqualTo extends BaseMXMLMatcher
    {
        private var _value:Number;

        /**
         * Constructor.
         */
        public function LessThanOrEqualTo()
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
            return lessThanOrEqualTo(value);
        }
    }
}