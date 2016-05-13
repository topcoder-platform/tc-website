package com.topcoder.web.reg.transaction;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface Transaction {
    void begin() throws TransactionException;

    void commit() throws TransactionException;

    boolean isActive() throws TransactionException;

    void rollback() throws TransactionException;
}
