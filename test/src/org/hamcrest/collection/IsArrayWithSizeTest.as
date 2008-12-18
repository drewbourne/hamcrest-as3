package org.hamcrest.collection {
  
  import org.hamcrest.AbstractMatcherTestCase;
  import org.hamcrest.collection.arrayWithSize;
  import org.hamcrest.equalTo;
  
  public class IsArrayWithSizeTest extends AbstractMatcherTestCase {
    
    public function testMatchesWhenSizeIsCorrect():void {
      assertMatches("correct size", arrayWithSize(equalTo(3)), [1, 2, 3]);
      assertDoesNotMatch("incorrect size", arrayWithSize(equalTo(2)), [1, 2, 3]);
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
        assertDescription("an array with size <3>", arrayWithSize(equalTo(3)));
        assertDescription("an empty array", emptyArray());
    }
  }
}