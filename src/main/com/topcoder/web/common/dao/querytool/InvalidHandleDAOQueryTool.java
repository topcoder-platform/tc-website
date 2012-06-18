/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.querytool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.dao.InvalidHandleDAO;
import com.topcoder.web.common.dao.InvalidHandleDAOException;

/**
 * <p>
 * This class represents query DAO for retrieving invalid handles from persistence.
 * </p>
 * <p>
 * Sample usage:
 * 
 * <pre>
 * 
 * 
 * // find such handle in offensive words
 * String handle = &quot;ass&quot;;
 * 
 * String actual = queryTool.find(handle);
 * 
 * // find all offensive words
 * List&lt;String&gt; listOfOffensiveWords = queryTool.list();
 * </pre>
 * 
 * </p>
 * <p>
 * Thread safety: This class is thread-safety as it's immutable.
 * </p>
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class InvalidHandleDAOQueryTool extends Base implements InvalidHandleDAO {

    /**
     * Creates an instance of InvalidHandleDAOQueryTool.
     */
    public InvalidHandleDAOQueryTool() {
    }

    /**
     * Retrieves handle from persistence that is equal to passed handle or null if not found.
     * @param handle the handle to be retrieved from persistence
     * @return retrieved handle from persistence that is equal to passed handle or null if not found
     * @throws IllegalArgumentException if given argument is null/empty
     * @throws InvalidHandleDAOException if any error occurs while retrieving handle
     */
    public String find(String handle) {
        if (handle == null || handle.trim().length() == 0) {
            throw new IllegalArgumentException("Handle should not be null or empty");
        }
        Request r = new Request();
        r.setContentHandle("invalid_handle");
        r.setProperty("handle", handle);
        System.out.println("Request created.");
        List<String> result = getData(r, "invalid_handle");
        return result.size() == 0 ? null : result.get(0);
    }

    /**
     * <p>
     * Retrieves list of invalid handles from persistence.
     * </p>
     * <p>
     * Executes given request on query tool and retrieves result for given query name.
     * </p>
     * @param r the request to be processed
     * @param queryName the query name to execute
     * @return retrieves list of invalid handles from persistence
     * @throws InvalidHandleDAOException if any error occurs while retrieving handles
     */
    private List<String> getData(Request r, String queryName) {
        List<String> retList = null;
        try {
            DataAccessInt dai = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true);
            Map<String, ResultSetContainer> result = dai.getData(r);
            ResultSetContainer rsc = result.get(queryName);
            retList = new ArrayList<String>(rsc.size());
            for (ResultSetRow rsr : rsc) {
                String value = rsr.getStringItem("handle");
                retList.add(value);
            }
        } catch (Exception e) {
            throw new InvalidHandleDAOException("Error occurred while retrieving data from query tool.", e);
        }
        return retList;
    }

    /**
     * Retrieves list of invalid handles from persistence.
     * @return list of invalid handles from persistence
     * @throws InvalidHandleDAOException if any error occurs while retrieving handles
     */
    public List<String> list() {
        Request r = new Request();
        r.setContentHandle("invalid_handle_all");
        return getData(r, "invalid_handle_all");
    }
}