/*
 * CatalogSearchView.java
 * 26 August 2002
 * 0.001
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;


/**
 * A representation of the results of a search performed on the component
 * catalog.
 *
 * @version 1.0, 22 September 2002
 * @author  Albert Mao
 * @see     Catalog
 */
public class CatalogSearchView implements java.io.Serializable {


    private Collection results;


    CatalogSearchView(Collection results) {
        this.results = Collections.unmodifiableCollection(results);
    }

    /**
     * Returns an iterator over the search results.
     *
     * @return an <code>Iterator</code> over the search results. Each result is
     * an instance of <code>ComponentSummary</code>
     * @see ComponentSummary
     */
    public Iterator iterator() {
        return results.iterator();
    }


    /**
     * Returns the size of the search results
     *
     * @return size of search results
     */
    public int size() {
        return results.size();
    }
}