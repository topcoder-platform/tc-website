/*
 * RowData.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * an interface describing the contract of an object that can manipulate rows
 * of a table.  Objects implementing this interface will normally be specific
 * to one table.
 */
interface RowData {

    /**
     * returns an <code>Object</code> representing this row's primary key
     */
    public Object getPrimaryKey();

    /**
     * stores the data encapsulated by this object into the row represented
     * by the current row of the supplied <code>ResultSet</code>
     *
     * @param  rs a <code>ResultSet</code> with the cursor on an existing row
     *         that is to be updated with the data from this
     *         <code>RowData</code>
     */
    public void storeRowData(ResultSet rs) throws SQLException;

    /**
     * inserts the data encapsulated by this object into the table by means of
     * the supplied <code>ResultSet</code>
     *
     * @param  rs a <code>ResultSet</code> that is to be used to insert the data
     *         from this <code>RowData</code> into the database
     */
    public void insertRowData(ResultSet rs) throws SQLException;

    /**
     * reads the data encapsulated by this object from the current row of the
     * supplied <code>ResultSet</code>
     *
     * @param  rs a <code>ResultSet</code> from which this <code>RowData</code>
     *         should be populated
     */
    public void readRowData(ResultSet rs) throws SQLException;

    /**
     * checks whether the data encapsulated by this object match the data in the
     * current row of the supplied <code>ResultSet</code>
     *
     * @param  rs a <code>ResultSet</code> to which the data of this
     *         <code>RowData</code> are to be compared
     */
    public boolean matchesResultSet(ResultSet rs) throws SQLException;

}