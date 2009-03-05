/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;
import java.lang.String;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.json.object.io.JSONDecodingException;
import com.topcoder.json.object.io.StandardJSONDecoder;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * Base class for Mod Dash leaderboard related controllers. It provides base
 * implementation for developmentProcessing() which implements required 
 * logic by calling abstract methods. These method are responsible for 
 *   - providing feed URL
 *   - providing path to view page (JSP)
 *   - processing of retrieved feed data
 * Also it provides method for retrieval of userId for given handle.
 *    
 * @author TCSDEVELOPER
 */
public abstract class ModDashStatBase extends Base {
    /**
     * Name of JSONObject property that will hold feed data (rows).
     */
    protected static String JSON_FEED_ROWS_ARRAY_KEY = "data";
    
    /**
     * Name of JSONObject property that will hold coder handle.
     */
    protected static String USER_HANDLE_KEY = "handle";
    
    /**
     * Name of property that should be passed to query that will retrieve 
     * userID from DB. 
     */
    protected static String DB_REQUEST_USER_PARAMETER_NAME = "ha";
    
    /**
     * Name of command that should be executed in order to get userID. 
     */
    protected static String USER_ID_USING_HANDLE_COMMAND_NAME = "user_id_using_handle";
    
    /**
     * Name of a query that will return userId.
     */
    protected static String USER_ID_USING_HANDLE_QUERY_NAME = "user_id";
    
    /**
     * Name of userID property.
     */
    protected static String USER_ID_PROPERTY_NAME = "user_id";
    
    /**
     * Name of request property to which retrieved feed data will be bound.
     */
    protected static String WEB_REQUEST_DATA_PARAMETER_NAME = "feedData";
    
    /**
     * Method should return feed URL that should be queried for data. 
     * @return feed url
     */
    abstract protected String getFeedURL();
    
    /**
     * Method should return path to JSP file (view) which will be used 
     * to present retrieved data.
     * @return
     */
    abstract protected String getPageName();
    
    /**
     * Method that is responsible for processing retrieved feed data. 
     * @throws TCWebException when any exception occurs
     */
    abstract protected void statProcessing() throws TCWebException;
    
    /**
     * Method responsible for retrieval of feed data from URL taken from 
     * getFeedURL() method. Retrieved data is decoded to JSONObject which 
     * has to contain "data" attribute that holds array of feed objects.
     * 
     * @return JSON array with feed data 
     * @throws TCWebException if any exception occurs
     */
    private JSONArray getFeedData() throws TCWebException {
        byte[] buffer = new byte[8192];
        try {
            // open connection and read feed data into string
            URL feedUrl = new URL(getFeedURL());
            BufferedInputStream feedInputStream = new BufferedInputStream(feedUrl.openStream(), 1024*1024);
            StringBuffer jsonString = new StringBuffer();
            int bytesRead = -1;
            while ((bytesRead = feedInputStream.read(buffer, 0, buffer.length)) != -1) {
                jsonString.append(new String(buffer, 0, bytesRead)); 
            }
            
            // decode feed data into JSONObject
            StandardJSONDecoder jsonDecoder = new StandardJSONDecoder();
            JSONObject feedData = jsonDecoder.decodeObject(jsonString.toString());
            
            // return array holding actual feed data
            return feedData.getArray(JSON_FEED_ROWS_ARRAY_KEY);
            
        } catch (MalformedURLException e) {
            throw new TCWebException("Feed url \"" + getFeedURL() + "\" is malformed.", e);
        } catch (IOException e) {
            throw new TCWebException("IO error when reading feed data (" + getFeedURL() + ").", e);
        } catch (JSONDecodingException e) {
            throw new TCWebException("Can't decode feed (" + getFeedURL() + ").", e);
        } 
    }
    
    /**
     * Method responsible for retrieval of userID for given handle. 
     * @param handle user handle
     * @return user ID or -1 if no such user found
     * @throws TCWebException in case of any error
     */
    protected int getUserIdForHandle(String handle) throws TCWebException {
        try {
            Request dataRequest = new Request();
            CachedDataAccess dataAccess = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty(DB_REQUEST_USER_PARAMETER_NAME, handle);
            dataRequest.setContentHandle(USER_ID_USING_HANDLE_COMMAND_NAME);
            Map<String, ResultSetContainer> data = dataAccess.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) data.get(USER_ID_USING_HANDLE_QUERY_NAME);
            if (rsc.size() != 0) {
                return rsc.getIntItem(0, USER_ID_PROPERTY_NAME);
            }
            return -1;
        } catch (Exception e) {
            throw new TCWebException("An exception was thrown when processing feed data.", e);
        }
    }
    
    /**
     * Method responsible for handling user request. It retrieves feed data
     * and stores it as a request attribute, after that statProcessing() is 
     * called in order to allow subclasses to manipulate retrieved data.
     * @throws TCWebException in case of any error 
     */
    protected void developmentProcessing() throws TCWebException {
        JSONArray feedData = getFeedData();
        getRequest().setAttribute(WEB_REQUEST_DATA_PARAMETER_NAME, feedData);
        setNextPage(getPageName());
        setIsNextPageInContext(true);
        statProcessing();
    }
    
}
