package org.hamcrest.collection {

    import org.hamcrest.AbstractMatcherTestCase;

    public class IsArrayWithSizeTest extends AbstractMatcherTestCase {

        public function testMatchesWhenSizeIsCorrect():void {
            assertMatches("correct size", arrayWithSize(3), [1, 2, 3]);
            assertDoesNotMatch("incorrect size", arrayWithSize(2), [1, 2, 3]);
        }

        public function testProvidesConvenientShortcutForArrayWithSizeEqualTo():void {
            assertMatches("correct size", arrayWithSize(3), [1, 2, 3]);
            assertDoesNotMatch("incorrect size", arrayWithSize(2), [1, 2, 3]);
        }

        public function testEmptyArray():void {
            assertMatches("correct size", emptyArray(), []);
            assertDoesNotMatch("incorrect size", emptyArray(), [1]);
        }

        public function testHasAReadableDescription():void {
            assertDescription("an Array with size <3>", arrayWithSize(3));
            assertDescription("an empty Array", emptyArray());
        }
    }
}
