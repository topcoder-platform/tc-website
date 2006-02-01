package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public final class TaskArena {


    private static final String XSL_DIR = TCServlet.XSL_ROOT + "arena/";
    private static Logger log = Logger.getLogger(TaskArena.class);

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            String xsldocURLString = null;
            StringBuffer url = new StringBuffer(request.getRequestURI());
            String query = request.getQueryString();
            if (query != null) {
                url.append("/?");
                url.append(query);
            }
            String command = Conversion.checkNull(request.getParameter("c"));
            xsldocURLString = XSL_DIR + command + ".xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (Exception e) {
            throw new NavigationException(e);
        }
        return result;
    }
}
