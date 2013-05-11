/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.util;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.dto.UserInfoDTO;
import com.topcoder.reg.services.EntityNotFoundException;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogManager;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.SecretQuestion;

/**
 * This class contains a collection of data access methods.
 * <p>
 * <strong>Thread Safety:</strong> This class is thread-safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public final class DataProvider {

    /**
     * Represent the qualified name of this class.
     */
    private static final String CLASS_NAME = DataProvider.class.getName();

    /**
     * Log instance for this class.
     */
    private static Log logger = LogManager.getLog(CLASS_NAME);

    /**
     * This method would retrieve secret question for the given handle.
     * 
     * @param handle
     *            The handle
     * @return Secret question.
     * @throws EntityNotFoundException
     *             If there is not such secret question.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public static SecretQuestion getSecretQuestionByHandle(String handle) throws EntityNotFoundException,
            PersistenceException {
        final String signature = CLASS_NAME + "#getSecretQuestionByHandle(String handle)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "handle" }, new String[] { handle });
        SecretQuestion question = null;
        try {
            Request r = new Request();
            r.setContentHandle("reg_secret_question_response");
            r.setProperty("ha", handle);
            DataAccess dataAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = dataAccess.getData(r).get("reg_secret_question_response");
            if (rsc.size() > 0) {
                question = new SecretQuestion();
                ResultSetRow row = rsc.get(0);
                question.setQuestion(row.getStringItem("question"));
                question.setResponse(row.getStringItem("response"));
                LoggingWrapperUtility.logExit(logger, signature, new Object[] { question });
                return question;
            } else {
                EntityNotFoundException e = new EntityNotFoundException(
                        "Secret question for the given handle is not found");
                LoggingWrapperUtility.logException(logger, signature, e);
                throw e;
            }
        } catch (Exception e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while retrieving secret question for the given handle: " + handle, e);
        }
    }

    /**
     * This method is to get the user info of the given handle.
     * 
     * @param handle
     *            The given handle.
     * @return Instance of {@link UserInfoDTO}.
     * @throws EntityNotFoundException
     *             If such status is not found.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public static UserInfoDTO getUserStatusByHandle(String handle) throws EntityNotFoundException, PersistenceException {
        final String signature = CLASS_NAME + "#getUserStatusByHandle(String handle)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "handle" }, new String[] { handle });

        try {
            Request r = new Request();
            r.setContentHandle("reg_user_info");
            r.setProperty("ha", handle);
            DataAccess dataAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = dataAccess.getData(r).get("reg_user_info");

            if (rsc.size() > 0) {
                ResultSetRow row = rsc.get(0);
                UserInfoDTO info = new UserInfoDTO();
                char[] userStatusInCharArray = row.getStringItem("user_status").toCharArray();

                info.setUserStatus(userStatusInCharArray[0]);
                info.setEmailStatus(row.getIntItem("email_status"));
                info.setEmailAddress(row.getStringItem("address"));
                info.setHandle(handle);
                info.setUserId(row.getLongItem("user_id"));

                LoggingWrapperUtility.logExit(logger, signature, new Object[] { info });
                return info;
            } else {
                EntityNotFoundException e = new EntityNotFoundException(
                        "User/email status for the given handle is not found");
                LoggingWrapperUtility.logException(logger, signature, e);
                throw e;
            }
        } catch (Exception e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while retrieving user/email status for the given handle: " + handle,
                    e);
        }

    }

    /**
     * This method get all countries as a list.
     * 
     * @return List of {@link Country}.
     * @throws PersistenceException
     *             If there is any DB Error.
     */
    public static List<Country> getAllCountries() throws PersistenceException {
        final String signature = CLASS_NAME + "#getAllCountries()";
        LoggingWrapperUtility.logEntrance(logger, signature, null, null);
        try {
            Request r = new Request();
            r.setContentHandle("reg_all_countries");
            DataAccess dataAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = dataAccess.getData(r).get("reg_all_countries");
            List<Country> countries = new ArrayList<Country>();
            Country c = null;
            for (ResultSetRow row : rsc) {
                c = new Country();
                c.setCode(row.getStringItem("code"));
                c.setName(row.getStringItem("name"));
                countries.add(c);
            }
            return countries;
        } catch (Exception e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while retrieving country list", e);
        }

    }

    /**
     * This method checks if a given email address has been taken.
     * 
     * @param email
     *            Email address to check.
     * @return true if not taken; false otherwise.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public static boolean isEmailAvailable(String email) throws PersistenceException {
        final String signature = CLASS_NAME + "#isEmailAvailable(String email)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "email" }, new String[] { email });
        try {
            Request r = new Request();
            r.setContentHandle("reg_email_available");
            r.setProperty("email", email);
            DataAccess dataAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = dataAccess.getData(r).get("reg_email_available");
            boolean available = rsc.getBooleanItem(0, "available");
            LoggingWrapperUtility.logExit(logger, signature, new Object[] { available });
            return available;
        } catch (Exception e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while retrieving country list", e);
        }
    }

    /**
     * This method checks if the given handle is enlisted in common_oltp:invalid_handles table.
     * 
     * @param handle
     *            Handle to check.
     * @return true if it's indeed invalid; false otherwise.
     * @throws PersistenceException
     *             If there is anything wrong.
     */
    public static boolean isExactInvalidHandle(String handle) throws PersistenceException {
        final String signature = CLASS_NAME + "#isExactInvalidHandle(String handle)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "handle" }, new String[] { handle });
        try {
            Request r = new Request();
            r.setContentHandle("invalid_handle");
            r.setProperty("ha", handle);
            DataAccess dataAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = dataAccess.getData(r).get("invalid_handle");
            boolean isInvalid = !rsc.isEmpty();
            LoggingWrapperUtility.logExit(logger, signature, new Object[] { isInvalid });
            return isInvalid;
        } catch (Exception e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while validating invalid handle", e);
        }
    }

}
