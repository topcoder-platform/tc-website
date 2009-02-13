package com.topcoder.web.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public interface TCRequest extends HttpServletRequest {
    public Cookie getCookie(String name);
}
