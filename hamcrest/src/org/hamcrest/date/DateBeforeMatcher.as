package org.hamcrest.date
{
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;
	

	public class DateBeforeMatcher extends TypeSafeMatcher
	{
		private var _compareDate:Date;
		private var _inclusive : Boolean;
		
		public function DateBeforeMatcher( value : Date, inclusive : Boolean = false )
		{
			super(Date);
			this._compareDate = value;
			this._inclusive = inclusive;
		}
		
		override public function matchesSafely( value : Object ) : Boolean
		{
			if( _inclusive )
				return value <= _compareDate;
			else
				return value < _compareDate;
		}
		
		override public function describeMismatch(item:Object, mismatchDescription:Description):void {
            mismatchDescription.appendValue(item)
                .appendText(" is not before ");

            mismatchDescription.appendValue(_compareDate);
        }
		
		override public function describeTo( description : Description ) : void
		{
			description.appendText( _compareDate.toString() + " should be less than"  );
		}
		
	}
}