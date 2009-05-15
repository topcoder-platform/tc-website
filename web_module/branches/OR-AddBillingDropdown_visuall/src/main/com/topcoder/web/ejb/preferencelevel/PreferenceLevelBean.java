/*
 * TCS Screening Tool 1.1
 *
 * PreferenceLevelBean.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.ejb.preferencelevel;

import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import java.rmi.RemoteException;

/**
 * An implementation class for <code>Preference Level EJB</code>.
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public class PreferenceLevelBean extends BaseEJB {

    /**
     * A <code>String</code> name of a table holding the preference levels for users.
     */
    private final static String PREFERENCE_TABLE = "company_user_preference";

    /**
     * A <code>String</code> name of table column containing the company IDs.
     */
    private final static String COMPANY_ID = "company_id";

    /**
     * A <code>String</code> name of table column containing the candidate IDs.
     */
    private final static String USER_ID = "user_id";

    /**
     * A <code>String</code> name of table column containing the preference values.
     */
    private final static String LEVEL = "level";

    /**
     * A <code>String</code> name of table column containing the IDs of a users creating/updating the preference levels
     * of a candidates.
     */
    private final static String USER_MODIFY_ID = "modify_user";

    /**
     * Creates a preference level for specified candidate relevant to specified company. This method must be used only
     * if a candidate does not have a preference level relevant to company specified yet. If sich a preference level has
     * been already set then <code>updateUserPreference</code> method must be used to change the existing preference
     * level.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a company to create new user preference for.
     * @param  userId a <code>long</code> containing the ID of a candidate to create new preference for.
     * @param  level an <code>int</code> preference level for specified candidate.
     * @param  modifyUserId a <code>long</code> containing the ID of a user attempting to create a preference level.
     * @throws com.topcoder.web.ejb.preferencelevel.DuplicatePreferenceLevelException if a preference level relevant to specified company is already set for
     *         specified candidate.
     * @throws EJBException if addition of new preference level had failed due to unexpected error.
     * @see    #update(String, long, long, int, long)
     */
    public void createUserPreference(String dataSource, long companyId, long userId, int level, long modifyUserId)
            throws DuplicatePreferenceLevelException {

        // todo : Determine if this check should be performed by the outside code. This call seems to be redundant since
        // todo : the code using this EJB may perform such checking prior to calling createUserPreference method.
        if (exists(dataSource, companyId, userId)) {
            throw new DuplicatePreferenceLevelException("The preference level already exists", userId, companyId);
        }

        String[] columnNames = new String[]{COMPANY_ID, USER_ID, LEVEL, USER_MODIFY_ID};
        String[] columnValues = new String[]{String.valueOf(companyId), String.valueOf(userId),
                                             String.valueOf(level), String.valueOf(modifyUserId)};

        int numRowsInserted = insert(PREFERENCE_TABLE, columnNames, columnValues, dataSource);

        if (numRowsInserted != 1) {
            throw new EJBException("Wrong number of rows inserted into '" + PREFERENCE_TABLE + "'. Inserted "
                    + numRowsInserted + ", should have inserted 1.");
        }
    }

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
     * @param  modifyUserId a <code>long</code> containing the ID of a candidate attempting to update a preference
     *         level.
     * @throws com.topcoder.web.ejb.preferencelevel.NoSuchPreferenceLevelException if the preference level for specified candidate relevant to specified
     *         company hasn't been specified yet.
     * @throws EJBException if update of existing preference level had failed due to unexpected error.
     * @see    #createUserPreference(String, long, long, int, long)
     */
    public void update(String dataSource, long companyId, long userId, int level, long modifyUserId)
            throws NoSuchPreferenceLevelException {

        // The columns to update
        String[] columnsName = new String[]{LEVEL, USER_MODIFY_ID};
        String[] columnsValue = new String[]{String.valueOf(level), String.valueOf(modifyUserId)};

        // The columns used to locate the desired record
        String[] constraintColumns = new String[]{COMPANY_ID, USER_ID};
        String[] constraintValues = new String[]{String.valueOf(companyId), String.valueOf(userId)};

        int numRowsUpdated = update(PREFERENCE_TABLE, columnsName, columnsValue, constraintColumns,
                constraintValues, dataSource);

        if (numRowsUpdated != 1) {
            throw new NoSuchPreferenceLevelException("No preference level set", userId, companyId);
        }
    }

    /**
     * Gets the preference level for specified candidate relevant to specified company.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a requested company to get the candidate preference
     *         level relevant to.
     * @param  userId a <code>long</code> containing the ID of a candidate to get the preference level for.
     * @return an <code>int</code> representing the candidate's preference level relevant to specified company.
     * @throws com.topcoder.web.ejb.preferencelevel.NoSuchPreferenceLevelException if the preference level for specified candidate relevant to specified
     *         company hasn't been specified yet.
     * @throws EJBException if retrieval of existing preference level had failed due to unexpected error.
     */
    public int getLevel(String dataSource, long companyId, long userId) throws NoSuchPreferenceLevelException {

        // The columns to locate the desired record
        String[] constraintColumns = new String[]{COMPANY_ID, USER_ID};
        String[] constraintValues = new String[]{String.valueOf(companyId), String.valueOf(userId)};

        Integer level = null;
        try {
            level = selectInt(PREFERENCE_TABLE, LEVEL, constraintColumns, constraintValues, dataSource);
        } catch (RowNotFoundException e) {
        }

        if (level == null) {
            throw new NoSuchPreferenceLevelException("No preference level has been specified", userId, companyId);
        }

        return level.intValue();
    }

    /**
     * Gets the ID of the last user rated the specified candidate in context of specified company.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a company to get the last "modify" user for.
     * @param  userId a <code>long</code> containing the ID of a candidate to get the last "modify" user for.
     * @return a <code>long</code> ID of a user modified the preference level for specified candidate last time.
     * @throws com.topcoder.web.ejb.preferencelevel.NoSuchPreferenceLevelException if there is no preference level relevant to specified company assigned to
     *         specified candidate.
     * @throws EJBException if retrieval of user ID had failed due to unexpected error.
     */
    public long getModifyUserId(String dataSource, long companyId, long userId) throws NoSuchPreferenceLevelException {

        // The columns to locate the desired record
        String[] constraintColumns = new String[]{COMPANY_ID, USER_ID};
        String[] constraintValues = new String[]{String.valueOf(companyId), String.valueOf(userId)};

        Long modifyUserId = null;

        try {
            modifyUserId = selectLong(PREFERENCE_TABLE, USER_MODIFY_ID, constraintColumns, constraintValues,
                    dataSource);
        } catch (RowNotFoundException e) {
        }

        if (modifyUserId == null) {
            throw new NoSuchPreferenceLevelException("No preference level has been specified", userId, companyId);
        }

        return modifyUserId.longValue();
    }

    /**
     * Checks if a preference level for specified candidate relevant to specified company has been specified or not.
     *
     * @param  dataSource a <code>String</code> JNDI name of a <code>DataSource</code> providing access to application
     *         data.
     * @param  companyId a <code>long</code> containing the ID of a company to check the existence of candidate
     *         preference level for.
     * @param  userId a <code>long</code> containing the ID of a candidate to check the existence of preference level
     *         for.
     * @return <code>true</code> if a preference level for specified candidate within the context of specified company
     *         is specified; <code>false</code> otherwise.
     * @throws EJBException if checking for existing preference level had failed due to unexpected error.
     */
    public boolean exists(String dataSource, long companyId, long userId) {

        // The columns to locate the desired record
        String[] constraintColumns = new String[]{COMPANY_ID, USER_ID};
        String[] constraintValues = new String[]{String.valueOf(companyId), String.valueOf(userId)};

        Integer level = null;

        try {
            level = selectInt(PREFERENCE_TABLE, LEVEL, constraintColumns, constraintValues, dataSource);
        } catch (RowNotFoundException e) {
        }

        return level != null;
    }
}
