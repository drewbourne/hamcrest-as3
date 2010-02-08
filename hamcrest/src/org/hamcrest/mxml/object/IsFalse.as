package org.hamcrest.mxml.object
{
  import org.hamcrest.Matcher;
  import org.hamcrest.mxml.BaseMXMLMatcher;
  import org.hamcrest.object.isFalse;
  
  /**
   * Matches target if it is <code>false</code>
   * 
   * @see org.hamcrest.object#isFalse()
   * 
   * @example
   * <listing version="3.0">
   *  &lt;hc:IsFalse target="{ checkBox.selected }" /&gt;
   * </listing>
   * 
   * @author Drew Bourne
   */
  public class IsFalse extends BaseMXMLMatcher
  {
    /**
     * Constructor.
     */
    public function IsFalse()
    {
      super();
      
      invalidateProperties();
    }
    
    /**
     * Create an a Matcher using <code>isFalse()</code> 
     */
    override protected function createMatcher():Matcher
    {
      return isFalse();
    }
  }
}