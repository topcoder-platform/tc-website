package com.topcoder.common.web.xml;

import java.util.*;
import com.topcoder.common.Log;

public final class ExcludeRange implements Comparable {
  
  private int start;
  private int end;
  private static final boolean VERBOSE = false;

  public ExcludeRange() {
    start = 0;
    end = 0;
  }

  public ExcludeRange(int start, int end) {
    this.start = start;
    this.end = end;
    /////////////////////////////////////////
    if (VERBOSE) {
      StringBuffer msg = new StringBuffer ( 100 );
      msg.append ( ":ExcludeRange ("            );
      msg.append ( start                        );
      msg.append ( ","                          );
      msg.append ( end                          );
      msg.append ( ") length="                  );
      msg.append ( (end - start)                );
      msg.append ( " created"                   );
      Log.msg( msg.toString()       );
    }
    /////////////////////////////////////////
  }

  public int compareTo(Object other) {
    int result = 0;
    ExcludeRange otherRange = (ExcludeRange) other;
    if (this.start < otherRange.start) {
      result = -1;
    } else if (this.start > otherRange.start) {
      result = 1;
    }
    return result;
  }

// set
  public void setStart(int start) {
    this.start = start;
  }

  public void setEnd(int end) {
    this.end = end;
  }

// get
  public int getStart() {
    return start;
  }

  public int getEnd() {
    return end;
  }

  public void shift ( int offset ) {
    ////////////////////////////////////////
    if (VERBOSE) {
      StringBuffer msg = new StringBuffer ( 200 );
      msg.append ( ":ExcludeRange.shift("       );
      msg.append ( offset                       );
      msg.append ( ")\n  :start:"               );
      msg.append ( this.start                   );
      msg.append ( "=>"                         );
      msg.append ( (this.start+offset)          );
      msg.append ( "\n  :end:"                  );
      msg.append ( this.end                     );
      msg.append ( "=>"                         );
      msg.append ( (this.end+offset)            );
      Log.msg( msg.toString()       );
    }
    ////////////////////////////////////////
    this.start += offset;
    this.end += offset;
  }


}

