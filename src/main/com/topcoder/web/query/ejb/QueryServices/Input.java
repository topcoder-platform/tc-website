package com.topcoder.web.query.ejb.QueryServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface Input extends EJBObject {

    void createInput(String inputCode, int dataTypeId, String inputDesc) throws RemoteException, EJBException;

    void setInputCode(long inputId, String inputCode) throws RemoteException, EJBException;
    void setDataTypeId(long inputId, int dataTypeId) throws RemoteException, EJBException;
    void setInputDesc(long inputId, String inputDesc) throws RemoteException, EJBException;

    boolean inputCodeExists(String inputCode) throws RemoteException, EJBException;
    String getInputCode(long inputId) throws RemoteException, EJBException;
    int getDataTypeId(long inputId) throws RemoteException, EJBException;
    String getInputDesc(long inputId) throws RemoteException, EJBException;
    ResultSetContainer getAllInputs() throws RemoteException, EJBException;

    void setDataSource(String dataSourceName) throws RemoteException, EJBException;

}

