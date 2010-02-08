package org.hamcrest.mxml.object
{
  import org.hamcrest.Matcher;
  import org.hamcrest.mxml.BaseMXMLMatcher;
  import org.hamcrest.object.isTrue;
  
  /**
   * Matches target if it is <code>true</code>
   * 
   * @see org.hamcrest.object#isTrue()
   * 
   * @example
   * <listing version="3.0">
   *  &lt;hc:IsTrue target="{ checkBox.selected }" /&gt;
   * </listing>
   * 
   * @author Drew Bourne
   */
  public class IsTrue extends BaseMXMLMatcher
  {
    /**
     * Constructor.
     */
    public function IsTrue()
    {
      super();
      
      invalidateProperties();
    }
    
    /**
     * Create an a Matcher using <code>isTrue()</code> 
     */
    override protected function createMatcher():Matcher
    {
      return isTrue();
    }
  }
}