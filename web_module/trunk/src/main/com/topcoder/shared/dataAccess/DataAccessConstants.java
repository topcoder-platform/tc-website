package com.topcoder.shared.dataAccess;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * A class to store the constants used for data access.
 * @author Greg Paul
 * @version  $Revision$ $Date$
 *
 */
public class DataAccessConstants {
    private static TCResourceBundle bundle = new TCResourceBundle("DataAccess");
    /**
     * A key used to get a query
     */
    public static String QUERY_KEY = bundle.getProperty("QUERY", "query");

}
