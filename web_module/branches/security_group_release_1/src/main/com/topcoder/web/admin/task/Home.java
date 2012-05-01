package com.topcoder.web.admin.task;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.web.admin.XSLConstants;
import com.topcoder.web.common.NavigationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public final class Home {

    public static String process(HttpServletRequest request, HttpServletResponse response,
                                 HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            result = HTMLmaker.render(document, XSLConstants.DIR + "home.xsl");
        } catch (Exception e) {
            throw new NavigationException(e);
        }
        return result;
    }


}
