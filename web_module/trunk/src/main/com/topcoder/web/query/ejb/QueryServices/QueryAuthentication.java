package com.topcoder.web.query.ejb.QueryServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.Set;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface QueryAuthentication extends EJBObject {

    /**
     * Gets the user_id, handle and password for the specified handle
     * @param handle
     * @return ResultSetContainer containing the user_id, handle and password
     * @throws EJBException if there was a problem with query execution
     */
    public ResultSetContainer getLoginInfo(String handle) throws EJBException;

}

