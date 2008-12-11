package com.topcoder.web.reg.transaction;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;

import javax.transaction.*;
import javax.naming.NamingException;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class J2EETransaction implements Transaction {

    TransactionManager tm;

    public J2EETransaction() throws TransactionException {
        try {
            tm = (TransactionManager) TCContext.getInitial().lookup(ApplicationServer.TRANS_MANAGER);
        } catch (NamingException e) {
            throw new TransactionException(e);
        }
    }


    public void begin() throws TransactionException {
        try {
            tm.begin();
        } catch (NotSupportedException e) {
            throw new TransactionException(e);
        } catch (SystemException e) {
            throw new TransactionException(e);
        }
    }

    public void commit() throws TransactionException {
        try {
            tm.commit();
        } catch (RollbackException e) {
            throw new TransactionException(e);
        } catch (HeuristicMixedException e) {
            throw new TransactionException(e);
        } catch (HeuristicRollbackException e) {
            throw new TransactionException(e);
        } catch (SystemException e) {
            throw new TransactionException(e);
        }
    }

    public boolean isActive() throws TransactionException {
        try {
            return tm.getStatus()==Status.STATUS_ACTIVE;
        } catch (SystemException e) {
            throw new TransactionException(e);
        }

    }

    public void rollback() throws TransactionException {
        try {
            tm.rollback();
        } catch (SystemException e) {
            throw new TransactionException(e);
        }
    }
}
