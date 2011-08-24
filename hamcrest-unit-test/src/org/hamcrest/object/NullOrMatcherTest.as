/*
 * Copyright 2011 Overstock.com and others.
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list of
 * conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 * conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * 
 * Neither the name of the Hamcrest nor the names of its contributors may be used to
 * endorse or promote products derived from this software without specific prior
 * written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

package org.hamcrest.object {
import org.hamcrest.Matcher;
import org.hamcrest.assertThat;
import org.hamcrest.number.greaterThan;
import org.hamcrest.text.emptyString;

public class NullOrMatcherTest {

  public function NullOrMatcherTest() {
  }

  private var matcher:Matcher;

  [Test]
  public function nullOrGreaterThanZero():void {
    matcher = nullOr(greaterThan(0));
    assertThat(matcher.matches(null));
    assertThat(matcher.matches(1));
    assertThat(matcher.matches(0),
               equalTo(false));
  }

  [Test]
  public function nullOrEmptyString():void {
    matcher = nullOr(emptyString());

    assertThat(matcher.matches(null));
    assertThat(matcher.matches(""));
    assertThat(matcher.matches("   "));
    assertThat(matcher.matches("sdlkfjsl"),
               equalTo(false));
  }

}

}
