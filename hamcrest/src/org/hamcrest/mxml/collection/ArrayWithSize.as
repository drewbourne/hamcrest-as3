package org.hamcrest.mxml.collection
{
    import flash.events.Event;

    import org.hamcrest.Matcher;
    import org.hamcrest.collection.arrayWithSize;
    import org.hamcrest.mxml.BaseMXMLMatcher;

    /**
     * Dispatched when the <code>size</code> property is changed.
     */
    [Event(name='sizeChanged', type = 'flash.events.Event')]

    /**
     * MXML facade for the arrayWithSize() / IsArrayWithSizeMatcher
     *
     * @see org.hamcrest.collection.arrayWithSize
     * @see org.hamcrest.collection.IsArrayWithSizeMatcher
     *
     * @example
     * <listing version="3.0">
     *  <hc:ArrayWithSize size="3" />
     * </listing>
     *
     * @author Drew Bourne <andrew@firstbourne.com>
     */
    public class ArrayWithSize extends BaseMXMLMatcher
    {

        private var _size:int;

        /**
         * Constructor.
         */
        public function ArrayWithSize()
        {
            super();
        }

        /**
         * Expected size of the target Array.
         */
        [Bindable('sizeChanged')]
        public function get size():int
        {
            return _size;
        }

        public function set size(value:int):void
        {
            if (_size != value)
            {
                _size = value;
                changed('size');
            }
        }

        /**
         * @inheritDoc
         */
        override protected function createMatcher():Matcher
        {
            return arrayWithSize(size);
        }
    }
}
