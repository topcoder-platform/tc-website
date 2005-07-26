/**
 *  SkinUtils.java
 *  July 25, 2000
 */

package com.coolservlets.forum.util;

import com.coolservlets.forum.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

/**
 *
 */
public class SkinUtils {

    // Name of the authentication token (is stored in the user's session)
    private static final String JIVE_AUTH_TOKEN_NAME = "jiveAuthorization";

    // Name of the cookie used to store user info for auto-login purposes
    private static final String JIVE_AUTOLOGIN_COOKIE_NAME = "jiveAutoLogin";

    // Time measurements (in milliseconds)
    private static final long SECOND = 1000;
    private static final long MINUTE = 60 * SECOND;
    private static final long HOUR = 60 * MINUTE;
    private static final long DAY = 24 * HOUR;
    private static final long WEEK = 7 * DAY;

    // Days of the week
    private static final String[] DAYS_OF_WEEK =
            {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

    // SimpleDateFormat objects for use in the dateToText method
    private static final SimpleDateFormat dateFormatter =
            new SimpleDateFormat("EEEE, MMM d");
    private static final SimpleDateFormat yesterdayFormatter =
            new SimpleDateFormat("'Yesterday at' h:mm a");

    /**
     *  Determines if the user of a particular skin is authenticated. To be
     *  authenticated, either (or both) of the following conditions must be
     *  satisfied:
     *  <ul>
     *  <li>An authentication token is found in the user's session and it is
     *      not null. Its existence proves the user is logged in.
     *  <li>If the skin supports auto-login there must be a cookie set which
     *      contains the username and password of the skin user. From these
     *      values, a new authentication token is created and stored in the
     *      user's session.
     *  </ul>
     *  This method will return false if either of these conditions are not met.
     *
     *  @param request The HttpServletRequest object, known as "request" in a
     *  JSP page.
     *  @param response The HttpServletResponse object, known as "response" in
     *  a JSP page.
     *  @param session THe HttpSession object, known as "session" in a JSP page.
     *  @returns true if the user is authenticated, false otherwise
     */
    public static boolean userIsAuthorized
            (HttpServletRequest request, HttpSession session) {
        // Check for the jive authentication token in the user's session.
        Authorization authToken = (Authorization) session.getAttribute(JIVE_AUTH_TOKEN_NAME);
        if (authToken != null) {
            return true;
        } else {
            // try to get the user's cookie
            Cookie cookies[] = request.getCookies();
            if (cookies == null) {
                return false;
            } else {
                String username = null;
                String password = null;
                boolean foundCookie = false;
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals(JIVE_AUTOLOGIN_COOKIE_NAME)) {
                        String cookieVal = cookies[i].getValue();
                        if (cookieVal != null && (cookieVal.indexOf("|") > -1)) {
                            username = cookieVal.substring(0, cookieVal.indexOf("|"));
                            password = cookieVal.substring(cookieVal.indexOf("|") + 1, cookieVal.length());
                            System.out.println("***************** JIVE ALERT !!!! ************************");
                            System.out.println("***************** JIVE ALERT !!!! ************************");
                            System.out.println("***************** Jive found a cookie and set the username to ~" + username + "~ ************************");
                            foundCookie = true;
                        }
                        break;
                    }
                }
                if (!foundCookie) {
                    return false;
                } else {
                    // set a new authorization token
                    AuthorizationFactory authFactory = AuthorizationFactory.getInstance();
                    try {
                        authToken = authFactory.getAuthorization(username, password);
                        session.setAttribute(JIVE_AUTH_TOKEN_NAME, authToken);
                        return true;
                    } catch (UnauthorizedException ue) {
                        return false;
                    }
                }
            }
        }
    }

    /**
     *  Returns the specified cookie's value or null if the cookie is not found.
     *
     *  @param request The HttpServletRequest object, known as "request" in a
     *  JSP page.
     *  @returns The cookie (if found), null otherwise
     */
    public static Cookie getCookie(String name) {
        return new Cookie("", "");
    }

    /**
     *
     *
     *  @param
     *  @param
     *  @param
     *  @returns
     */
    public static String quoteOriginal(String messageText, String delimiter, int lineLength) {
        return "";
    }

    /**
     *  Returns a string describing the amount of time between now (current
     *  system time) and the passed in date time. Example output is "5 hours
     *  ago" or "Yesterday at 3:30 pm"
     *
     *  @param date Date to compare current time with.
     *  @returns A description of the difference in time, ie: "5 hours ago"
     *  or "Yesterday at 3:30pm"
     */
    public static String dateToText(Date date) {

        if (date == null) {
            return "";
        }

        long currentTime = System.currentTimeMillis();
        long dateTime = date.getTime();
        long timeDiff = currentTime - dateTime;

        // within the last hour
        if ((timeDiff / HOUR) < 1) {
            long minutes = (timeDiff / MINUTE);
            if (minutes == 0) {
                return "Less than 1 min ago";
            } else if (minutes == 1) {
                return "1 minute ago";
            } else {
                return (minutes + " minutes ago");
            }
        }

        // sometime today
        if ((timeDiff / DAY) < 1) {
            long hours = (timeDiff / HOUR);
            if (hours < 1) {
                return "1 hour ago";
            } else {
                return (hours + " hours ago");
            }
        }

        // within the last week
        if ((timeDiff / WEEK) < 1) {
            long days = (timeDiff / DAY);
            if (days <= 1) {
                return yesterdayFormatter.format(date);
            } else {
                return dateFormatter.format(date);
            }
        }

        // before a week ago
        else {
            return "Before this week";
        }
    }

    /**
     *
     */
    public static boolean isSystemAdmin(Authorization authToken) {
        ForumFactory forumFactory = ForumFactory.getInstance(authToken);
        ForumPermissions permissions = forumFactory.getPermissions(authToken);
        return permissions.get(ForumPermissions.SYSTEM_ADMIN);
    }

    /**
     *
     */
    public static boolean isForumAdmin(Authorization authToken) {
        ForumFactory forumFactory = ForumFactory.getInstance(authToken);
        Iterator forumIterator = forumFactory.forums();
        if (!forumIterator.hasNext()) {
            return false;
        }
        while (forumIterator.hasNext()) {
            Forum forum = (Forum) forumIterator.next();
            if (forum.hasPermission(ForumPermissions.FORUM_ADMIN)) {
                return true;
            }
        }
        return false;
    }

}
