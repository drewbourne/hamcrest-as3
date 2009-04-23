package org.hamcrest.core {

    import org.hamcrest.BaseMatcher;
    import org.hamcrest.Description;
    import org.hamcrest.Matcher;

    public class ShortcutCombinationMatcher extends BaseMatcher {

        private var _matchers:Array;
        private var _operator:String;

        public function ShortcutCombinationMatcher(matchers:Array, operator:String) {

            super();

            // TODO ensure matchers are actually Matcher instances 
            _matchers = matchers || [];
            _operator = operator || "";
        }

        public function matchesOrShortcuts(item:Object, shortcut:Boolean):Boolean {

            for each (var matcher:Matcher in _matchers) {
                if (matcher.matches(item) == shortcut) {
                    return shortcut;
                }
            }

            return !shortcut;
        }

        override public function describeTo(description:Description):void {
            description.appendList("(", " " + _operator + " ", ")", _matchers);
        }
    }
}
