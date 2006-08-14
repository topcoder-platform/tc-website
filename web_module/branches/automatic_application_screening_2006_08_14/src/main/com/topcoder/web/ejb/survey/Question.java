package com.topcoder.web.ejb.survey;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface Question extends EJBObject {

    long createQuestion(String text, int statusId, String keyword, int questionTypeId,
                        int questionStyleId, boolean required, String dataSource) throws RemoteException;

    void setText(long questionId, String text, String dataSource) throws RemoteException;

    void setStatusId(long questionId, int statusId, String dataSource) throws RemoteException;

    void setKeyword(long questionId, String keyword, String dataSource) throws RemoteException;

    void setQuestionTypeId(long questionId, int questionTypeId, String dataSource) throws RemoteException;

    void setQuestionStyleId(long questionId, int questionStyleId, String dataSource) throws RemoteException;

    void setRequired(long questionId, boolean required, String dataSource) throws RemoteException;

    String getText(long questionId, String dataSource) throws RemoteException;

    int getStatusId(long questionId, String dataSource) throws RemoteException;

    String getKeyword(long questionId, String dataSource) throws RemoteException;

    int getQuestionTypeId(long questionId, String dataSource) throws RemoteException;

    int getQuestionStyleId(long questionId, String dataSource) throws RemoteException;

    boolean isRequired(long questionId, String dataSource) throws RemoteException;

}
