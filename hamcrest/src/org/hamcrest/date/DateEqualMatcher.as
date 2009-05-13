package org.hamcrest.date
{
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;
	

	public class DateEqualMatcher extends TypeSafeMatcher
	{
		private var _compareDate:Date;
		
		public function DateEqualMatcher( value : Date )
		{
			super(Date);
			this._compareDate = value;
		}
		
		override public function matchesSafely( value : Object ) : Boolean
		{
			return ( value.getTime() == _compareDate.getTime() );
		}
		
		override public function describeMismatch(item:Object, mismatchDescription:Description):void {
            mismatchDescription.appendValue(item)
                .appendText(" is not the same as ");

            mismatchDescription.appendValue(_compareDate);
        }
		
		override public function describeTo( description : Description ) : void
		{
			description.appendText( "a date equal to " + _compareDate );
		}
		
	}
}