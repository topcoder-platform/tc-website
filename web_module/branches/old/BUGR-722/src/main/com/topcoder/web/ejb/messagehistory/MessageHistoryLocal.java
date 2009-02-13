package com.topcoder.web.ejb.messagehistory;

import java.util.Hashtable;

import javax.ejb.EJBLocalObject;
import javax.ejb.EJBException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * @author mtong
 */
public interface MessageHistoryLocal extends EJBLocalObject {

    public void addEdit(long messageId, String subject, String body, long modificationDate, String dataSource) throws EJBException;

    public ResultSetContainer getEdits(long messageId, String dataSource) throws EJBException;
    
    public int getEditCount(long messageId, String dataSource) throws EJBException;
    
    public Hashtable getMessageEditCounts(long threadId, String dataSource) throws EJBException;
}