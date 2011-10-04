package org.hamcrest.date
{
	import org.hamcrest.StringDescription;

	public function describeDate(date:Date):String
	{
		return (new StringDescription().appendValue(date).toString())
	}
}