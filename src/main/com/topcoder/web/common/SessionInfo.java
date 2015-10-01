/*
 * Copyright (C) 2015 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common;

import com.topcoder.security.RolePrincipal;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.security.WebAuthentication;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TimeZone;
import java.net.URLEncoder;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.commons.httpclient.Credentials;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

/**
 * <p>
 *  Represents the information stored in session, most data are for the logged-in user.
 * </p>
 *
 * <p>
 *     Updates in (TC Community Site - Header Footer UX Update) version 1.1
 *     <ul>
 *         <li>Add {@link #getImagePath()} to get the user's avatar image path. If no image, return the default</li>
 *     </ul>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.1 (TC Community Site - Header Footer UX Update)
 */
public class SessionInfo implements Serializable {
    private static Logger log = Logger.getLogger(SessionInfo.class);

    private static final String GROUP_PREFIX = "group_";

    /**
     * The default image path for user who does not have avatar uploaded.
     *
     * @since 1.1
     */
    private static final String NO_USER_IMAGE_PATH = "/i/m/nophoto_submit.gif";

    private String handle = null;
    private long userid = SimpleUser.createGuest().getId();
    private String serverName = null;
    private String servletPath = null;
    private String absoluteServletPath = null;
    private String queryString = null;
    private String requestString = null;
    private Date date = null;
    private boolean isLoggedIn = false;
    private int memberCount = -1;
    private boolean knownUser = false;
    protected String timezone = null;

    /**
     * The imagePath filed to hold the retrieved image path for user in session.
     *
     * @since 1.1
     */
    private String imagePath = null;

    /**
     * group may be:
     * 'G' guest
     * 'A' admin
     */
    private char group = 'G';

    public SessionInfo() {
        date = new Date();
    }

    public SessionInfo(TCRequest request, WebAuthentication authentication, Set groups) throws Exception {
        this();
        userid = authentication.getActiveUser().getId();
        handle = authentication.getActiveUser().getUserName();

        if (pruneGroups(groups).contains("Admin"))
            setGroup('A');
        else {
            setGroup('G');
        }

        serverName = request.getServerName();
        servletPath = request.getContextPath() + request.getServletPath();
        String query = request.getQueryString();
        queryString = (query == null) ? ("") : ("?" + query);
        StringBuffer buf = new StringBuffer(200);
        buf.append("http://");        //todo any better way than a hardcode?
        buf.append(request.getServerName());
        buf.append(servletPath);
        buf.append(queryString);
        requestString = buf.toString();

        absoluteServletPath = request.getServerName() + servletPath;

        isLoggedIn = !authentication.getUser().isAnonymous();

        if (log.isDebugEnabled()) {
            log.debug("servername: " + getServerName() + " servletpath:" + getServletPath() + " query: " +
                    getQueryString() + " request: " + getRequestString());
        }
        knownUser = authentication.isKnownUser();

    }


    public String getHandle() {
        return handle;
    }

    public long getUserId() {
        return userid;
    }

    private void setGroup(char group) {
        if (0 > "GA".indexOf(group))
            throw new IllegalArgumentException("no group class '" + group + "'");
        this.group = group;
    }

    public boolean isLoggedIn() {
        return isLoggedIn;
    }

    public boolean isAnonymous() {
        return userid == SimpleUser.createGuest().getId();
    }

    public boolean isAdmin() {
        return group == 'A';
    }

    public String getServerName() {
        return serverName;
    }

    public String getServletPath() {
        return servletPath;
    }

    public String getAbsoluteServletPath() {
        return "http://" + absoluteServletPath;
    }

    public String getSecureAbsoluteServletPath() {
        return "https://" + absoluteServletPath;
    }

    public String getQueryString() {
        return queryString;
    }

    public String getRequestString() {
        return requestString;
    }

    public Date getDate() {
        return date;
    }

    public boolean isKnownUser() {
        return knownUser;
    }

    public int getMemberCount() { 
        if (memberCount < 0) {
            try {
                memberCount = loadMemberCount();
            }
            catch (Exception e) {
                log.error(e);
            }
        }
        return memberCount;
    }

    public String getTimezone() {
        if (timezone == null) {
            try {
                timezone = loadTimezone();
            } catch (Exception e) {
                timezone = TimeZone.getDefault().getID();
                log.error("Could not load timezone from db, using : " + timezone);
            }
        }
        return timezone;
    }

    private String loadTimezone() throws Exception {
        CachedDataAccess tzDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Request tzReq = new Request();
        tzReq.setContentHandle("user_timezone");
        tzReq.setProperty(WebConstants.USER_ID, String.valueOf(getUserId()));
        return ((ResultSetContainer) tzDai.getData(tzReq).get("user_timezone")).getStringItem(0, "timezone_desc");
    }

    private int loadMemberCount() throws Exception {
			
        CachedDataAccess countDai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.OLTP_DATASOURCE_NAME);
        Request countReq = new Request();
        countReq.setContentHandle("member_count");
        int mc = ((ResultSetContainer) countDai.getData(countReq).get("member_count")).getIntItem(0, "member_count");
		//mc = mc + loadCSMemberCount();
		return mc;
    }

    /**
     * Helper method to retrieve the avatar image path for current user in session.
     *
     * @return image path of the user's avatar. Return constant NO_USER_IMAGE_PATH if user does not have avatar uploaded.
     * @throws Exception if any error.
     * @since 1.1
     */
    private String loadImage() throws Exception {
        Request r = new Request();
        r.setContentHandle("member_image");
        r.setProperty("cr", String.valueOf(getUserId()));
        ResultSetContainer imageResult = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("coder_image_data");

        Integer image = null;

        if ((imageResult.size() > 0) && (imageResult.getItem(0, "image_id").getResultData() != null) && (imageResult.getIntItem(0, "image_id") != 0)) {
            image = imageResult.getIntItem(0, "image_id");
            if(image != null && image > 0) {
                String image_path = imageResult.getStringItem(0, "image_path");
                String fileName = imageResult.getStringItem(0, "file_name");
                imagePath = image_path + fileName;
            }
        }

        if (imagePath == null) {
            imagePath = NO_USER_IMAGE_PATH;
        }

        return imagePath;
    }

    /**
     * Gets the image path of the user.
     *
     * @return the image path of the user.
     * @since 1.1
     */
    public String getImagePath() {
        if (imagePath == null) {
            try {
                imagePath = loadImage();
            } catch (Exception e) {
                imagePath = NO_USER_IMAGE_PATH;
                log.error("Could not load user avatar image from db, using : " + imagePath);
            }
        }
        return imagePath;
    }

	private int loadCSMemberCount()  {
	
		try {
		HttpClient httpclient =  new HttpClient();
		GetMethod getMethod = null;
		
		URI uri = new URI("http://api.cloudspokes.com/v1/stats");
		
		getMethod = new GetMethod(uri.toString());
		getMethod.addRequestHeader("accept", "application/json");
		
		int status = httpclient.executeMethod(getMethod);
		//System.out.println("--------------status----"+status);
			
		String responseMessage = getMethod.getResponseBodyAsString();
		
		//System.out.println("--------------responseMessage----"+responseMessage);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Map<String, String>> mapValues =  mapper.readValue(responseMessage, new  TypeReference<Map<String,Map<String, String>>>(){});

		for (Object o:mapValues.values()) {
			Map omap = (Map)o;
			Object mc = omap.get("members");
			int mcount = Integer.parseInt((String)mc);  
			return mcount;
		}

		}
		catch (Exception e)
		{
			System.out.println("error getting CS member count :"+e);
			e.printStackTrace(System.out);
			return 0;
		}
		
		return 0;
	}


    protected Set pruneGroups(Set groups) {
        Set groupnames = new HashSet();
        Iterator it = groups.iterator();
        while (it.hasNext()) {
            String rolename = ((RolePrincipal) it.next()).getName();
            if (rolename.startsWith(GROUP_PREFIX))
                groupnames.add(rolename.substring(GROUP_PREFIX.length()));
        }
        return groupnames;
    }


}
