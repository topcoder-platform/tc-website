/**
 * 
 */
package com.topcoder.dde.catalog;

/**
 * Checked exception thrown to indicate an application-level exception occurred
 * during the operation of a component download
 *
 * @author  pulky
 */
public class ComponentDownloadException extends CatalogException {
    /**
     * Constructs a new <code>ComponentDownloadException</code> with
     * <code>null</code> as its detail message.
     */
    public ComponentDownloadException() {
        super();
    }

    /**
     * Constructs a new <code>ComponentDownloadException</code> with the
     * specified detail message.
     *
     * @param message the detail message
     */
    public ComponentDownloadException(String message) {
        super(message);
    }
}
