/*
 * CatalogException.java
 * 19 July 2002
 * 0.002
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.dde.DDEException;


/**
 * Checked exception thrown to indicate an application-level exception occurred
 * during the operation of the component catalog.
 *
 * @version 0.002, 19 July 2002
 * @author  Albert Mao
 * @see     Catalog
 * @see     ComponentManager
 */
public class CatalogException extends DDEException {


    /**
     * Constructs a new <code>CatalogException</code> with
     * <code>null</code> as its detail message.
     */
    public CatalogException() {
        super();
    }

    /**
     * Constructs a new <code>CatalogException</code> with the
     * specified detail message.
     *
     * @param message the detail message
     */
    public CatalogException(String message) {
        super(message);
    }


}