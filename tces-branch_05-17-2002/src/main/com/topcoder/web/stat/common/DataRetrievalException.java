package com.topcoder.web.stat.common;

/**
 * This is an exception class used by the data retrieval bean
 * to indicate an error while retrieving statistical data from
 * the database.
 *
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 */

public class DataRetrievalException extends Exception {
    /**
     * Constructs a <code>DataRetrievalException</code> object
     * with no message.
     */
    public DataRetrievalException() {
        super();
    }

    /**
     * Constructs a <code>DataRetrievalException</code> object
     * with no message.
     */
    public DataRetrievalException(String s) {
        super(s);
    }
}

