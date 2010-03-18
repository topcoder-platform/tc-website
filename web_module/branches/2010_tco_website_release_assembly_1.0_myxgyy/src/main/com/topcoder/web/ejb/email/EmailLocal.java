package com.topcoder.web.ejb.email;

import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
public interface EmailLocal extends EJBLocalObject {

    long createEmail(long userId, String dataSource, String idDataSource) throws EJBException;

    void setPrimaryEmailId(long userId, long emailId, String dataSource)
            throws EJBException;

    long getPrimaryEmailId(long userId, String dataSource)
            throws RowNotFoundException;

    boolean exists(long userId, String dataSource) throws EJBException;

    void setEmailTypeId(long emailId, long emailTypeId, String dataSource)
            throws EJBException;

    long getEmailTypeId(long emailId, String dataSource)
            throws RowNotFoundException;

    void setAddress(long emailId, String address, String dataSource)
            throws EJBException;

    int getStatusId(long emailId, String dataSource) throws RowNotFoundException;

    void setStatusId(long emailId, int statusId, String dataSource);

    String getAddress(long emailId, String dataSource) throws RowNotFoundException;

}
