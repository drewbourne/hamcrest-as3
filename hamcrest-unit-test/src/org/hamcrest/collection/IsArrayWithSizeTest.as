package org.hamcrest.collection
{
    import mx.collections.ArrayCollection;
    import mx.collections.ListCollectionView;
    
    import org.hamcrest.AbstractMatcherTestCase;

    public class IsArrayWithSizeTest extends AbstractArrayMatcherTestCase
    {
        [Test]
        public function matchesWhenSizeIsCorrect():void
        {
            assertMatches("correct size", arrayWithSize(3), [ 1, 2, 3 ]);
            assertDoesNotMatch("incorrect size", arrayWithSize(2), [ 1, 2, 3 ]);
        }

        [Test]
        public function providesConvenientShortcutForArrayWithSizeEqualTo():void
        {
            assertMatches("correct size", arrayWithSize(3), [ 1, 2, 3 ]);
            assertDoesNotMatch("incorrect size", arrayWithSize(2), [ 1, 2, 3 ]);
        }

        [Test]
        public function emptyArrayWithArrays():void
        {
            assertMatches("correct size", emptyArray(), []);
            assertDoesNotMatch("incorrect size", emptyArray(), [ 1 ]);
        }
		
		[Test]
		public function emptyArrayWithVector():void
		{
			var v:Vector.<Number> = new Vector.<Number>();
			assertMatches("correct size", emptyArray(), v);
			
			v.push(1);
			assertDoesNotMatch("incorrect size", emptyArray(), v);
		}
		
		[Test]
		public function emptyArraysWithForEachIterable():void
		{
			var emptyCollection:ListCollectionView = new ArrayCollection();
			assertMatches("correct size", emptyArray(), emptyCollection);
			
			var collection:ListCollectionView = new ArrayCollection();
			collection.addItem(1);
			assertDoesNotMatch("incorrect size", emptyArray(), collection);
		}

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("an Array with size <3>", arrayWithSize(3));
            assertDescription("an empty Array", emptyArray());
        }
        
        [Test]
        public function describesMismatch():void 
        {
            assertMismatch(
                "size was <4>", 
                arrayWithSize(3),
                [1, 2, 3, 4]);
        }
		
		[Test]
		public function failsWithNiceMismatchDescriptionsForNonIterableObjects():void 
		{
			assertMismatch('was <3>', arrayWithSize(1), 3);
			assertMismatch('was <true>', arrayWithSize(1), true);
			assertMismatch('was "String"', arrayWithSize(1), 'String');
			assertMismatch('was <Function>', arrayWithSize(1), function():void {});
		}
    }
}
