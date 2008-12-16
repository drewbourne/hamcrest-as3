package org.hamcrest {
  
  public function assertThatBoolean(reason:String, result:Boolean):void {

    if (!result) {
      throw new AssertionError(reason);
    }
  }
}

