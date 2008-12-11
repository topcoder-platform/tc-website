/**
 * 
 */
package com.topcoder.dde.catalog;

/**
 * Checked exception thrown to indicate the user is trying to get a non public component
 * during the operation of a component download
 *
 * @author  pulky
 */
public class NonPublicComponentException extends ComponentDownloadException {
    /**
     * Constructs a new <code>ComponentDownloadException</code> with
     * <code>null</code> as its detail message.
     */
    public NonPublicComponentException() {
        super();
    }

    /**
     * Constructs a new <code>ComponentDownloadException</code> with the
     * specified detail message.
     *
     * @param message the detail message
     */
    public NonPublicComponentException(String message) {
        super(message);
    }
}
