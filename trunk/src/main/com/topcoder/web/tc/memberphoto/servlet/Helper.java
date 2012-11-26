/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.json.object.JSONObject;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.ExtendedThreadLocalSessionContext;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.LongHibernateProcessor;
import com.topcoder.web.common.LongHibernateProcessor.HibernateSessionHouse;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.security.BasicAuthentication;

/**
 * <p>
 * This class is used by this component only. Provide some common utility
 * methods.
 * </p>
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 * @author AleaActaEst, microsky, TCSASSEMBLER
 * @version 1.0
 */
final class Helper {
    /**
     * The user persistor key field.
     */
    private static final String USER_PERSISTOR_KEY = "user_obj";
    
    /**
     * The user cookie name.
     */
    private static final String USER_COOKIE_NAME = "user_id";
    
    /**
     * The key of big session.
     */
    private static final String BIG_SESSION_KEY = "tcsso";
    
    /**
     * The guest user.
     */
    private static User GUEST = SimpleUser.createGuest(); 
    
    /**
     * Just some random junk no one else knows.  Should really come from a config file.
     */
    static final String HASH_SECRET = "GKDKJF80dbdc541fe829898aa01d9e30118bab5d6b9fe94fd052a40069385f5628";
    
    /**
     * <p>
     * Private constructor.
     * </p>
     */
    private Helper() {
    }

    /**
     * <p>
     * Checks whether the parameter is null.
     * </p>
     * @param param the parameter to check
     * @param paramName the name of the parameter
     * @throws IllegalArgumentException if the parameter is null
     */
    static void checkNull(final Object param, final String paramName) {
        if (param == null) {
            throw new IllegalArgumentException("The parameter '" + paramName
                    + "' should not be null.");
        }
    }

    /**
     * <p>
     * Checks whether a string is null or empty, if it is,
     * <code>IllegalArgumentException</code> is thrown.
     * </p>
     * @param param the string to check
     * @param paramName the parameter name
     * @throws IllegalArgumentException if the string is null or empty
     */
    static void checkString(final String param, final String paramName) {
        Helper.checkNull(param, paramName);

        if (param.trim().length() == 0) {
            throw new IllegalArgumentException("The parameter '" + paramName
                    + "' should not be empty.");
        }
    }

    /**
     * <p>
     * Checks whether a string is null or empty, if it is,
     * <code>IllegalStateException</code> is thrown.
     * </p>
     * @param param the string to check
     * @param paramName the parameter name
     * @throws IllegalStateException if the string is null or empty
     */
    static void checkState(final String param, final String paramName) {
        if (param == null || param.trim().length() == 0) {
            throw new IllegalStateException("The parameter '" + paramName
                    + "' should not be empty.");
        }
    }
    
    /**
     * Write a specified json object use http servlet response.
     * 
     * @param response
     *            the response used to write json object.
     * @param json
     *            the json object to write.
     * @param success
     *            whether to write as success info or not.
     * @throws IOException
     *             if any exception occurs when write.
     */
    static void writeJSONResult(HttpServletResponse response, JSONObject json, boolean success) throws IOException {
        if(json != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            PrintWriter writer = response.getWriter();
            
            JSONObject ret = new JSONObject();
            
            if (success) {
                ret.setNestedObject("success", json);
            } else {
                ret.setNestedObject("error", json);
            }
            
            writer.write(ret.toJSONString());
            writer.close();
        }
    }
    
    /**
     * Write a specified json object use http servlet response, as success message.
     * 
     * @param response
     *            the response used to write json object.
     * @param json
     *            the json object to write.
     * @throws IOException
     *             if any exception occurs when write.
     */
    static void writeJSONResult(HttpServletResponse response, JSONObject json) throws IOException {
        writeJSONResult(response, json, true);
    }
    
    /**
     * Retrieve user id in session or cookie.
     * 
     * @param request
     *            the request to analyze
     * @return retrieved used id
     * @throws MemberPhotoUploadException
     *             if can't find the user or the user is guest.
     */
    static long getUserId(HttpServletRequest request) throws MemberPhotoUploadException {
        Object userObj = request.getSession().getAttribute(USER_PERSISTOR_KEY);
        User user = null;
        
        if (userObj != null) {
            user = (User) userObj;
        }
        
        if (user == null || user.getId() == GUEST.getId()) {
            user = checkBigSession(request);
            if (user == null || user.getId() == GUEST.getId()) {
                user = (User) request.getSession().getAttribute(USER_COOKIE_NAME);
                if (user == null || user.getId() == GUEST.getId()) {
                    user = checkCookie(request);
                    
                    if (user == null || user.getId() == GUEST.getId()) {
                        throw new MemberPhotoUploadException("You must login first.");                        
                    }
                }
            }
        }
        
        return user.getId();  
    }
    
    /**
     * Retrieve user in big session.
     * 
     * @param request
     *            the request to check.
     * @return user if find, or null if not find.
     */
    private static User checkBigSession(HttpServletRequest request) {
        Cookie[] ca = request.getCookies();

        for (int i = 0; ca != null && i < ca.length; i++) {
            if (ca[i].getName().equals(BasicAuthentication.MAIN_SITE.getName() + "_" + BIG_SESSION_KEY + "_" + ApplicationServer.ENVIRONMENT)) {

                try {
                    StringTokenizer st = new StringTokenizer(ca[i].getValue(), "|");
                    long uid = Long.parseLong(st.nextToken());
                    
                    if (uid < 1) {
                        continue;
                    }
                    String hash = hashForUser(uid);
                    if (!hash.equals(st.nextToken())) continue;
                    
                    return new SimpleUser(uid, "", "");

                } catch (Exception e) {
                    System.out.println("exception parsing cookie");
                    /* junk in the cookie, ignore it */
                }
            }
        }
        
        return null;
    }
    
    /**
     * Start communication.
     * 
     * @param request the http request.
     */
    static void beginCommunication(HttpServletRequest request) {
        if (String.valueOf(true).equals(request.getAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG))) {
            throw new RuntimeException("Active conversation exists, can not start another");
        } else {
            HibernateSessionHouse house =
                    (HibernateSessionHouse) request.getSession().getAttribute(LongHibernateProcessor.HIBERNATE_SESSION_KEY);
            if (house != null) {
                System.out.println("bind existing hibernate session");
                ExtendedThreadLocalSessionContext.bind(house.getSession());
            } else {
                System.out.println("didn't fine the hibernate session, we'll have to create one");
            }

            HibernateUtils.begin();
            request.setAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG, String.valueOf(true));
        }
    }
    
    /**
     * End communication.
     * 
     * @param request the http request.
     */
    static void endCommunication(HttpServletRequest request) {
        System.out.println("close conversation");
        //only close if there is something to close
        if (String.valueOf(true).equals(request.getAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG))) {
            HibernateUtils.getSession().flush();
            HibernateUtils.commit();
            HibernateUtils.closeSession(); // Unbind is automatic here
            cleanup(request);
        } else if (HibernateUtils.getSession().isOpen()) {
            System.out.println("we're not closing a conversation that has an open session");
        }
    }

    /**
     * Clean up hibernate flags.
     * 
     * @param request
     *            the http request.
     */
    static private void cleanup(HttpServletRequest request) {
        System.out.println("cleanup");
        request.removeAttribute(LongHibernateProcessor.END_OF_CONVERSATION_FLAG);
        request.removeAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG);
        request.getSession().removeAttribute(LongHibernateProcessor.HIBERNATE_SESSION_KEY);
    }
    
    /**
     * Compute a one-way hash of a userid and the corresponding crypted
     * password, plus a magic string thrown in for good measure.  Salting
     * this might be nice, but it doesn't seem to buy us anything as long
     * as the magic string remains a secret.
     * <p/>
     * The intent here is that
     * 1) login cookies cannot be guessed
     * 2) changing your password should invalidate any login cookies which may exist
     * 3) login cookies cannot be used to gain any information about the password
     * 4) if user status changes, it invalidates login cookies
     * <p/>
     * I would just tack on the crypted password itself, but they are
     * reversibly encrypted with a secret key using Blowfish, and I don't
     * know how well Blowfish holds up to a chosen-plaintext attack.
     * <p/>
     * Calling this function is quite expensive; it runs a query on OLTP,
     * which cannot be cached and still get immediate behavior 2 above.
     * note: gpaul - i've changed it to cache the password for 30 minutes to avoid the db hit.
     * but it is still pretty intensive...currently takes around 300 ms
     *
     * @param uid the user id
     * @return the hash
     * @throws Exception if there is a problem getting data from the data base or if the MD5 algorithm doesn't exist
     */
    private static String hashForUser(long uid) throws Exception {
        CachedDataAccess dai = new CachedDataAccess(MaxAge.HALF_HOUR,
                DBMS.OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND,
                "userid_to_password");
        dataRequest.setProperty("uid", Long.toString(uid));
        @SuppressWarnings("rawtypes")
        Map dataMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) dataMap
                .get("userid_to_password");
        String password = rsc.getStringItem(0, "password");
        String status = rsc.getStringItem(0, "status");

        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] plain = (HASH_SECRET + uid + password + status).getBytes();
        byte[] raw = md.digest(plain);
        StringBuffer hex = new StringBuffer();
        for (byte aRaw : raw) {
            hex.append(Integer.toHexString(aRaw & 0xff));
        }
        return hex.toString();
    }
    
    /**
     * Check each cookie in the request header for a cookie set above.
     *
     * @return user if find, or null if not find.
     */
    private static User checkCookie(HttpServletRequest request) {
        Cookie[] ca = request.getCookies();
        for (int i = 0; ca != null && i < ca.length; i++) {
            if (ca[i].getName().equals(BasicAuthentication.MAIN_SITE.getName() + "_" + USER_COOKIE_NAME + "_" + ApplicationServer.ENVIRONMENT)) {

                try {
                    StringTokenizer st = new StringTokenizer(ca[i].getValue(), "|");
                    long uid = Long.parseLong(st.nextToken());
                    if (uid < 1) {
                        continue;
                    }
                    String hash = hashForUser(uid);
                    if (!hash.equals(st.nextToken())) {
                        continue;
                    }
                    return new SimpleUser(uid, "", "");

                } catch (Exception e) {
                    System.out.println("exception parsing cookie");
                    /* junk in the cookie, ignore it */
                }
            }
        }
        return null;
    }
}
