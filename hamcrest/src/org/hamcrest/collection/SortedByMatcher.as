package org.hamcrest.collection
{
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	import org.hamcrest.BaseMatcher;
	import org.hamcrest.Description;

	/**
	 * 
	 */
	public class SortedByMatcher extends BaseMatcher
	{
		private var _field:String;
		private var _caseInsensitive:Boolean;
		private var _descending:Boolean;
		private var _numeric:Boolean;
		
		public function SortedByMatcher(
			field:String, 
			caseInsensitive:Boolean = false, 
			descending:Boolean = false, 
			numeric:Boolean = false)
		{
			super();
			
			_field = field;
			_caseInsensitive = caseInsensitive;
			_descending = descending;
			_numeric = numeric;
		}
		
		override public function matches(item:Object):Boolean
		{
			if (item is Array)
			{
				item = new ArrayCollection(item as Array);
			}
			
			if (!(item is ListCollectionView))
			{
				return false;	
			}
				
    	var original:ListCollectionView = item as ListCollectionView;
    	
      // create a sorted version of the collection
     	var sorted:ListCollectionView = new ListCollectionView(original);
      sorted.sort = new Sort();
      sorted.sort.fields = [new SortField(_field, _caseInsensitive, _descending, _numeric)];
      sorted.refresh();
		            
      for (var i:int = 0, n:int = original.length; i < n; i++)
      {
        var o:Object = original[i];
        var s:Object = sorted[i];
        if (o !== s)
        {
        	return false;
        }
      }
        
      return true;
    }

    /**
     * @inheritDoc
     */
    override public function describeTo(description:Description):void
    {
        description.appendText("an Array sorted by ").appendValue(_field);
    }
	}
}