package com.topcoder.web.tc.controller.request.tournament;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.lang.String;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.json.object.io.JSONDecodingException;
import com.topcoder.json.object.io.StandardJSONDecoder;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.development.Base;

public abstract class ModDashStatBase extends Base {
    abstract protected String getFeedURL();
    abstract protected String getPageName();
    private static String JSON_FEED_ROWS_ARRAY_KEY = "data";
    private static String USER_HANDLE_KEY = "handle";
    private static String DB_REQUEST_USER_PARAMETER_NAME = "ha";
    private static String USER_ID_USING_HANDLE_COMMAND_NAME = "user_id_using_handle";
    private static String USER_ID_USING_HANDLE_QUERY_NAME = "user_id";
    private static String USER_ID_PROPERTY_NAME = "user_id";
    private static String WEB_REQUEST_DATA_PARAMETER_NAME = "feedData";
    
    protected void developmentProcessing() throws TCWebException {
        
        Request dataRequest = new Request();
        byte[] buffer = new byte[8192];
        CachedDataAccess dataAccess = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
        
        try {
            System.out.println("FeedURL: " + getFeedURL());
            URL feedUrl = new URL(getFeedURL());
            BufferedInputStream feedInputStream = new BufferedInputStream(feedUrl.openStream(), 1024*1024);
            StringBuffer jsonString = new StringBuffer();
            int bytesRead = -1;
            while ((bytesRead = feedInputStream.read(buffer, 0, buffer.length)) != -1) {
                jsonString.append(new String(buffer, 0, bytesRead)); 
            }
            
            StandardJSONDecoder jsonDecoder = new StandardJSONDecoder();
            JSONObject feedData = jsonDecoder.decodeObject(jsonString.toString());
            JSONArray rows = feedData.getArray(JSON_FEED_ROWS_ARRAY_KEY);
            
            for (int i = 0; i < rows.getSize(); i++) {
                JSONObject row = rows.getJSONObject(i);
                if (row.isAvailableAsString(USER_HANDLE_KEY)) {
                    dataRequest.setProperty(DB_REQUEST_USER_PARAMETER_NAME, row.getString(USER_HANDLE_KEY));
                    dataRequest.setContentHandle(USER_ID_USING_HANDLE_COMMAND_NAME);
                    Map<String, ResultSetContainer> data = dataAccess.getData(dataRequest);
                    ResultSetContainer rsc = (ResultSetContainer) data.get(USER_ID_USING_HANDLE_QUERY_NAME);
                    int userId = -1;
                    if (rsc.size() != 0) {
                        userId = rsc.getIntItem(0, USER_ID_PROPERTY_NAME);
                    }
                    row.setInt(USER_ID_PROPERTY_NAME, userId);
                }
                
            }
            getRequest().setAttribute(WEB_REQUEST_DATA_PARAMETER_NAME, rows); 
            
            setNextPage(getPageName());
            setIsNextPageInContext(true);
            
        } catch (MalformedURLException e) {
            throw new TCWebException("Feed url \"" + getFeedURL() + "\" is malformed.", e);
        } catch (IOException e) {
            throw new TCWebException("IO error when reading feed data (" + getFeedURL() + ").", e);
        } catch (JSONDecodingException e) {
            throw new TCWebException("Can't decode feed (" + getFeedURL() + ").", e);
        } catch (Exception e) {
            throw new TCWebException("An exception was thrown when processing feed data.", e);
        }
    }
}
