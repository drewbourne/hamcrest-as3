package org.hamcrest.date
{
	import org.hamcrest.Matcher;
	import org.hamcrest.core.describedAs;
	
	/**
     * Matches if the date item is after the given date.
     *
     * @param value Date the matched number must be after.
     * @return Matcher
     *
     * @example
     * <listing version="3.0">
     * assertThat( new Date(), dateAfter( new Date( 1920, 1, 1)));
     * </listing>
     */
	
	public function dateAfterOrEqual( value : Date ) : Matcher
	{
		var afterMatcher : DateAfterMatcher = new DateAfterMatcher( value, true );
		return describedAs( "a date after or equal to %0", afterMatcher, value );
		
	}

}