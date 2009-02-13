package com.topcoder.common;

import java.util.*;
import java.io.*;
import java.text.*;


public class Log {


  private static String LOG_TZ   = "EST";
  private static String LOG_DATE = "MMdd HH:mm:ss:SS";


  ////////////////////////////////////////////////////////////////////////////////
  public static final void msg ( boolean verbose, String in ) {
  ////////////////////////////////////////////////////////////////////////////////
    if (verbose) {
      msg(in);
    }
  }


  ////////////////////////////////////////////////////////////////////////////////
  public static final void msg ( String in ) {
  ////////////////////////////////////////////////////////////////////////////////
    Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(LOG_TZ));
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(LOG_DATE);
    sdf.setTimeZone(TimeZone.getTimeZone(LOG_TZ));
    System.out.println(sdf.format(cal.getTime()) + ": " + in);
  }


}
