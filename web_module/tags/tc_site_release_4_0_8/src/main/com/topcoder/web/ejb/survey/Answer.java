package com.topcoder.web.ejb.survey;


import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface Answer extends EJBObject {

    long createAnswer(long questionId, String text, int sort, String dataSource) throws RemoteException;

    void setText(long answerId, String text, String dataSource) throws RemoteException;

    void setSort(long answerId, int sort, String dataSource) throws RemoteException;

    String getText(long answerId, String dataSource) throws RemoteException;

    int getSort(long answerId, String dataSource) throws RemoteException;

    ResultSetContainer getAnswers(long questionId, String dataSource) throws RemoteException;

}
