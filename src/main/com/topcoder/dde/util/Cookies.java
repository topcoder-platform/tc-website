package com.topcoder.dde.util;

import com.topcoder.security.TCSubject;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.User;
import com.topcoder.dde.admin.AdminLogin;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.HashMap;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;

/**
 * This class is shameful cuz it totally screws up the dependency structure between
 * online reivew, dde and the new software site.
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 4, 2005
 */
public class Cookies {

    public final static String UID_COOKIE_NAME = "tcs_user_id";
    public final static String HASH_COOKIE_NAME = "tcs_hash";
    public final static int LOGIN_COOKIE_MAX_AGE = 1000000000; //a lot

    public static void clearLoginCookies(HttpServletResponse response) {

        Cookie userIdCookie = new Cookie(UID_COOKIE_NAME, "");
        userIdCookie.setPath("/");
        userIdCookie.setMaxAge(0);
        response.addCookie(userIdCookie);

        Cookie hashedPasswordCookie = new Cookie(HASH_COOKIE_NAME, "");
        hashedPasswordCookie.setPath("/");
        hashedPasswordCookie.setMaxAge(0);
        response.addCookie(hashedPasswordCookie);
    }

    public static TCSubject getUserFromLoginCookies(HttpServletRequest request, HttpServletResponse response, UserManagerRemote userManager) {

        try {
            Map cookies = new HashMap();
            Cookie[] cookieArr = request.getCookies();
            for (int i = 0; i < cookieArr.length; i++) cookies.put(cookieArr[i].getName(), cookieArr[i]);

            Cookie userIdCookie = (Cookie) cookies.get(UID_COOKIE_NAME);
            Cookie hashedPasswordCookie = (Cookie) cookies.get(HASH_COOKIE_NAME);

            if (userIdCookie == null && hashedPasswordCookie == null) return null;
            if (userIdCookie == null || hashedPasswordCookie == null) {
                clearLoginCookies(response);
                return null;
            }

            long userId = Long.parseLong(userIdCookie.getValue());
            String key = hashedPasswordCookie.getValue();

            User user = userManager.getUser(userId);
            String handle = user.getRegInfo().getUsername();
            String password = user.getRegInfo().getPassword();
            String hashedPassword = hashPassword(password, userId);

            if (key != null && key.equals(hashedPassword)) {
                return userManager.login(handle, password);
            } else {
                clearLoginCookies(response);
                return null;
            }
        } catch (Exception e) {
            clearLoginCookies(response);
            return null;
        }
    }

    public static TCSubject getAdminFromLoginCookies(HttpServletRequest request, HttpServletResponse response, UserManagerRemote userManager, AdminLogin adminLogin) {

        try {
            Map cookies = new HashMap();
            Cookie[] cookieArr = request.getCookies();
            for (int i = 0; i < cookieArr.length; i++) cookies.put(cookieArr[i].getName(), cookieArr[i]);

            Cookie userIdCookie = (Cookie) cookies.get(UID_COOKIE_NAME);
            Cookie hashedPasswordCookie = (Cookie) cookies.get(HASH_COOKIE_NAME);

            if (userIdCookie == null && hashedPasswordCookie == null) return null;
            if (userIdCookie == null || hashedPasswordCookie == null) {
                clearLoginCookies(response);
                return null;
            }

            long userId = Long.parseLong(userIdCookie.getValue());
            String key = hashedPasswordCookie.getValue();

            User user = userManager.getUser(userId);
            String handle = user.getRegInfo().getUsername();
            String password = user.getRegInfo().getPassword();
            String hashedPassword = hashPassword(password, userId);

            if (key != null && key.equals(hashedPassword)) {
                return adminLogin.login(handle, password);
            } else {
                clearLoginCookies(response);
                return null;
            }
        } catch (Exception e) {
            clearLoginCookies(response);
            return null;
        }
    }

    public static void setLoginCookies(long userId, String password, HttpServletResponse response) {

        try {
            Cookie userIdCookie = new Cookie(UID_COOKIE_NAME, "" + userId);
            userIdCookie.setPath("/");
            userIdCookie.setMaxAge(LOGIN_COOKIE_MAX_AGE);
            response.addCookie(userIdCookie);

            Cookie hashedPasswordCookie = new Cookie(HASH_COOKIE_NAME, hashPassword(password, userId));
            hashedPasswordCookie.setPath("/");
            hashedPasswordCookie.setMaxAge(LOGIN_COOKIE_MAX_AGE);
            response.addCookie(hashedPasswordCookie);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public static String hashPassword(String password, long uid) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] plain = ("h43kj396k2z"+uid+password).getBytes();
        byte[] raw = md.digest(plain);
        StringBuffer hex = new StringBuffer();
        for(int i=0; i<raw.length; i++)
            hex.append(Integer.toHexString(raw[i]&0xff));
        return hex.toString();
    }


}
