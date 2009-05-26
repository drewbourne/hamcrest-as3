package org.hamcrest.mxml {

    import flash.errors.IllegalOperationError;
    import flash.events.Event;
    import flash.events.EventDispatcher;

    import mx.core.IMXMLObject;

    import org.hamcrest.Description;
    import org.hamcrest.Matcher;
    import org.hamcrest.StringDescription;

    public class BaseMXMLMatcher extends EventDispatcher implements MXMLMatcher, IMXMLObject {

        private var _target:*;
        private var _targetChanged:Boolean;

        private var _matched:Boolean;
        private var _description:String;
        private var _mismatchDescription:String;

        private var _commitingProperties:Boolean;

        public function BaseMXMLMatcher() {
            super();
        }

        [Bindable('targetChanged')]
        public function get target():* {
            return _target;
        }

        public function set target(value:*):void {
            if (value == _target) {
                return;
            }

            _target = value;
            _targetChanged = true;
            dispatchEvent(new Event('targetChanged'));
            invalidateProperties();
        }

        [Bindable('descriptionChanged')]
        public function get description():String {
            return _description;
        }

        protected function setDescription(value:String):void {
            if (value == _description) {
                return;
            }

            _description = value;
            dispatchEvent(new Event('descriptionChanged'));
        }

        [Bindable('matchedChanged')]
        public function get matched():Boolean {
            return _matched;
        }

        protected function setMatched(value:Boolean):void {
            if (value == _matched) {
                return;
            }

            _matched = value;
            dispatchEvent(new Event('matchedChanged'));
        }

        [Bindable('mismatchDescriptionChanged')]
        [Bindable('matchedChanged')]
        public function get mismatchDescription():String {
            return _mismatchDescription;
        }

        public function setMismatchDescription(value:String):void {
            if (value == _mismatchDescription) {
                return;
            }

            _mismatchDescription = value;
            dispatchEvent(new Event('mismatchDescriptionChanged'));
        }

        /**
         * MXMLSupport
         */
        public function initialized(document:Object, id:String):void {
        }

        public function matches(item:Object):Boolean {
            return createMatcher().matches(item);
        }

        public function describeMismatch(item:Object, mismatchDescription:Description):void {
            createMatcher().describeMismatch(item, mismatchDescription);
        }

        public function describeTo(description:Description):void {
            createMatcher().describeTo(description);
        }

        protected function createMatcher():Matcher {
            throw new IllegalOperationError("BaseMXMLMatcher#createMatcher must be overridden by subclass");
        }

        protected function changed(property:String):void {
            dispatchEvent(new Event(property + 'Changed'));
            invalidateProperties();
        }

        protected function invalidateProperties():void {
            if (!_commitingProperties) {
                _commitingProperties = true;
                commitProperties();
                _commitingProperties = false;
            }
        }

        protected function commitProperties():void {
            evaluateDescription();
            evaluateMatchTarget();
        }

        protected function evaluateDescription():void {
            var d:StringDescription = new StringDescription();
            describeTo(d);
            setDescription(d.toString());
        }

        // evaluate match target
        // evaluate target match
        // evaluate match
        // match target
        protected function evaluateMatchTarget():void {
            setMatched(matches(target));
            if (!matched) {
                var md:StringDescription = new StringDescription();
                describeMismatch(target, md);
                setMismatchDescription(md.toString());
            }
            else {
                setMismatchDescription(null);
            }
        }

    }
}
