/*
 * TCS Screening Tool 1.1
 *
 * PreferenceLevel.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.ejb.preferencelevel;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * <p>A remote interface to <code>Preference Level EJB</code>.</p>
 *
 * <p>This stateless session <code>EJB</code> provides a set of methods allowing to assign a preference level for
 * specified candidate within the context of specified company, update such a level, check if such a preference level
 * for specified candidate exists, get the preference level for specified candidate within the context of specified
 * company.</p>
 *
 * <p>Also the <code>Preference Level EJB</code> provides a method to get the ID of a company user who had updated the
 * preference level for specified candidate last time. Such an ID is used for security permission checking.</p>
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public interface PreferenceLevel extends EJBObject {

    /**
     * Creates a preference level for specified candidate relevant to specified company. This method must be used only
     * if a candidate does not have a preference level relevant to company specified yet. If sich a preference level has
     * been already set then <code>updateUserPreference</code> method must be used to change the existing preference
     * level.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a company to create new candidate preference for.
     * @param  userId a <code>long</code> containing the ID of a candidate to create new preference for.
     * @param  level an <code>int</code> preference level for specified candidate.
     * @param  modifyUserId a <code>long</code> containing the ID of a user attempting to create a preference level.
     * @throws RemoteException as required by the <code>EJB Specification</code>.
     * @throws com.topcoder.web.ejb.preferencelevel.DuplicatePreferenceLevelException if a preference level relevant to specified company is already set for
     *         specified candidate.
     * @see    #update(String, long, long, int, long)
     */
    void createUserPreference(String dataSource, long companyId, long userId, int level, long modifyUserId)
            throws RemoteException, DuplicatePreferenceLevelException;

    /**
     * Updates the preference level for specified candidate relevant to specified company with new value. This method
     * should be used only if the preference level for specified candidate relevant for specified company already
     * exists. If this is not the case then <code>createUserPreference</code> method must be used instead.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a requested company to update the candidate preference
     *         level relevant to.
     * @param  userId a <code>long</code> containing the ID of a candidate to update the preference level for.
     * @param  level an <code>int</code> representing the new preference levele for specified candidate.
     * @param  modifyUserId a <code>long</code> containing the ID of a user attempting to update a preference level.
     * @throws RemoteException as required by the <code>EJB Specification</code>.
     * @throws com.topcoder.web.ejb.preferencelevel.NoSuchPreferenceLevelException if the preference level for specified candidate relevant to specified
     *         company hasn't been specified yet.
     * @see    #createUserPreference(String, long, long, int, long)
     */
    void update(String dataSource, long companyId, long userId, int level, long modifyUserId) throws RemoteException,
            NoSuchPreferenceLevelException;

    /**
     * Gets the preference level for specified candidate relevant to specified company.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a requested company to get the candidate preference
     *         level relevant to.
     * @param  userId a <code>long</code> containing the ID of a candidate to get the preference level for.
     * @return an <code>int</code> representing the candidate's preference level relevant to specified company.
     * @throws RemoteException as required by the <code>EJB Specification</code>.
     * @throws com.topcoder.web.ejb.preferencelevel.NoSuchPreferenceLevelException if the preference level for specified candidate relevant to specified
     *         company hasn't been specified yet.
     */
    int getLevel(String dataSource, long companyId, long userId) throws RemoteException, NoSuchPreferenceLevelException;

    /**
     * Gets the ID of the last user rated the specified candidate in context of specified company.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a company to get the last "modify" user for.
     * @param  userId a <code>long</code> containing the ID of a candidate to get the last "modify" user for.
     * @return a <code>long</code> ID of a user modified the preference level for specified candidate last time.
     * @throws RemoteException as required by the <code>EJB Specification</code>.
     * @throws com.topcoder.web.ejb.preferencelevel.NoSuchPreferenceLevelException if the preference level for specified candidate relevant to specified
     *         company hasn't been specified yet.
     */
    long getModifyUserId(String dataSource, long companyId, long userId) throws RemoteException,
            NoSuchPreferenceLevelException;

    /**
     * Checks if a preference level for specified candidate in context of specified company has been specified or not.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a company to check the existence of candidate
     *         preference level for.
     * @param  userId a <code>long</code> containing the ID of a candidate to check the existence of preference level
     *         for.
     * @return <code>true</code> if a preference level for specified candidate within the context of specified company
     *         is specified; <code>false</code> otherwise.
     * @throws RemoteException as required by the <code>EJB Specification</code>.
     */
    boolean exists(String dataSource, long companyId, long userId) throws RemoteException;
}
