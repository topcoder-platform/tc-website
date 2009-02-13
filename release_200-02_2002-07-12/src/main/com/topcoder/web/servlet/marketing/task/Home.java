package com.topcoder.web.servlet.marketing.task;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.web.servlet.marketing.XSL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public final class Home {

    public static String process(HttpServletRequest request, HttpServletResponse response,
                                 HTMLRenderer renderer, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            result = renderer.render(document, XSL.DIR + "home.xsl", null);
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("marketing.task.Home:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), XSL.INTERNAL_ERROR_URL);
        }
        return result;
    }


}
