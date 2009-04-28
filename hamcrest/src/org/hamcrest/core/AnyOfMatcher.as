package org.hamcrest.core {

    /**
     * Checks if the item being matched matches any of the given Matchers.
     *
     * @see org.hamcrest.core.anyOf
     */
    public class AnyOfMatcher extends ShortcutCombinationMatcher {

        /**
         * Constructor.
         *
         * @param matchers Array of Matcher instance
         */
        public function AnyOfMatcher(matchers:Array) {
            super(matchers, "or");
        }

        /**
         * @inheritDoc
         */
        override public function matches(item:Object):Boolean {
            return matchesOrShortcuts(item, true);
        }
    }
}
