/**
 * 
 */
package com.topcoder.dde.catalog;

/**
 * Checked exception thrown to indicate the user has reached his quota
 * during the operation of a component download
 *
 * @author  pulky
 */
public class ReachedQuotaException extends ComponentDownloadException {
    /**
     * Constructs a new <code>ComponentDownloadException</code> with
     * <code>null</code> as its detail message.
     */
    public ReachedQuotaException() {
        super();
    }

    /**
     * Constructs a new <code>ComponentDownloadException</code> with the
     * specified detail message.
     *
     * @param message the detail message
     */
    public ReachedQuotaException(String message) {
        super(message);
    }
}
