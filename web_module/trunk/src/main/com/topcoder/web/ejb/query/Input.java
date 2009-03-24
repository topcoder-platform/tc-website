package com.topcoder.web.ejb.query;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface Input extends EJBObject {

    long createInput(String inputCode, int dataTypeId, String inputDesc, String dataSourceName) throws RemoteException, EJBException;

    void setInputCode(long inputId, String inputCode, String dataSourceName) throws RemoteException, EJBException;

    void setDataTypeId(long inputId, int dataTypeId, String dataSourceName) throws RemoteException, EJBException;

    void setInputDesc(long inputId, String inputDesc, String dataSourceName) throws RemoteException, EJBException;

    boolean inputCodeExists(String inputCode, String dataSourceName) throws RemoteException, EJBException;

    String getInputCode(long inputId, String dataSourceName) throws RemoteException, EJBException;

    int getDataTypeId(long inputId, String dataSourceName) throws RemoteException, EJBException;

    String getInputDesc(long inputId, String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getAllInputs(String dataSourceName) throws RemoteException, EJBException;

}

