<%@ page import="com.topcoder.security.TCSubject,
                 java.util.Map,
                 java.util.HashMap,
                 com.topcoder.dde.user.UserManagerRemote,
                 com.topcoder.dde.user.User,
                 java.security.MessageDigest,
                 java.security.NoSuchAlgorithmException,
                 com.topcoder.apps.review.projecttracker.UserManagerLocal,
                 com.topcoder.apps.review.EJBHelper,
                 com.topcoder.apps.review.projecttracker.SecurityEnabledUser,
                 javax.naming.Context,
                 javax.naming.InitialContext,
                 com.topcoder.apps.review.projecttracker.UserManagerLocalHome,
                 javax.rmi.PortableRemoteObject"%>
<%!
    final String UID_COOKIE_NAME = "tcs_user_id";
    final String HASH_COOKIE_NAME = "tcs_hash";
    final int LOGIN_COOKIE_MAX_AGE = 1000000000; //a lot

    void clearLoginCookies(HttpServletResponse response) {

        Cookie userIdCookie = new Cookie(UID_COOKIE_NAME, "");
        userIdCookie.setPath("/");
        userIdCookie.setMaxAge(0);
        response.addCookie(userIdCookie);

        Cookie hashedPasswordCookie = new Cookie(HASH_COOKIE_NAME, "");
        hashedPasswordCookie.setPath("/");
        hashedPasswordCookie.setMaxAge(0);
        response.addCookie(hashedPasswordCookie);
    }

    SecurityEnabledUser getUserFromLoginCookies(HttpServletRequest request, HttpServletResponse response, UserManagerRemote userManager) {

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
                TCSubject tcSubject = userManager.login(handle, password);
                UserManagerLocal userManagerLocal = getUserManager(request.getSession());
                return userManagerLocal.getUser(tcSubject);
            } else {
                clearLoginCookies(response);
                return null;
            }
        } catch (Exception e) {
            clearLoginCookies(response);
            return null;
        }
    }

    void setLoginCookies(long userId, String password, HttpServletResponse response) {

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

    String hashPassword(String password, long uid) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] plain = ("h43kj396k2z"+uid+password).getBytes();
        byte[] raw = md.digest(plain);
        StringBuffer hex = new StringBuffer();
        for(int i=0; i<raw.length; i++)
            hex.append(Integer.toHexString(raw[i]&0xff));
        return hex.toString();
    }

    UserManagerLocal getUserManager(HttpSession session) {

        UserManagerLocal userManager = (UserManagerLocal) session.getAttribute("USER_MANAGER_LOCAL");

        if (userManager == null) {
            try {
                Context initial = new InitialContext();
                Object objref = initial.lookup(UserManagerLocalHome.EJB_REF_NAME);
                UserManagerLocalHome home = (UserManagerLocalHome) PortableRemoteObject.narrow(objref, UserManagerLocalHome.class);
                userManager = home.create();
                session.setAttribute("USER_MANAGER_LOCAL", userManager);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return userManager;
    }
%>