package com.topcoder.shared.dataAccess;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * @author Greg Paul
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *
 */
public class DataAccessConstants {
  private static TCResourceBundle bundle = new TCResourceBundle("DataAccess");
  public static String QUERY_KEY = bundle.getProperty("QUERY", "query");
 
}
