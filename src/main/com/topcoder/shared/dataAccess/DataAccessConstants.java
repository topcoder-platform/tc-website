package com.topcoder.shared.dataAccess;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * A class to store the constants used for data access.
 * @author Greg Paul
 * @version  $Revision$ $Date$
 * Log of Changes:
 *           $Log$
 *           Revision 1.1  2002/07/18 23:57:53  gpaul
 *           added so that one could dynamically create queries on the front end and then get result sets back
 *
 *
 */
public class DataAccessConstants {
    private static TCResourceBundle bundle = new TCResourceBundle("DataAccess");
    /**
     * A key used to get a query
     */
    public static String QUERY_KEY = bundle.getProperty("QUERY", "query");

}
