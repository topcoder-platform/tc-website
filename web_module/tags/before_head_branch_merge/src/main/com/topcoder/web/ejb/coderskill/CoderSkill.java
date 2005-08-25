/*
 * CoderSkill.java
 *
 * Created on October 8, 2004, 2:21 PM
 */

package com.topcoder.web.ejb.coderskill;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author  rfairfax
 */
public interface CoderSkill extends EJBObject {

    void createCoderSkill(long coderId, int skillId, int ranking, String dataSource) throws EJBException, RemoteException;

    void bulkCreateCoderSkill(long coderId, int[] skillId, int[] ranking, String dataSource) throws EJBException, RemoteException;

    void removeCoderSkill(long coderId, int skillId, String dataSource) throws EJBException, RemoteException;

    void bulkRemoveCoderSkill(long coderId, int[] skillId, String dataSource) throws EJBException, RemoteException;

    void setRanking(long coderId, int skillId, int ranking, String dataSource) throws EJBException, RemoteException;

    void bulkSetRanking(long coderId, int[] skillId, int[] ranking, String dataSource) throws EJBException, RemoteException;

    ResultSetContainer getSkillsByType(long coderId, int skillTypeId, String dataSource) throws EJBException, RemoteException;
}
