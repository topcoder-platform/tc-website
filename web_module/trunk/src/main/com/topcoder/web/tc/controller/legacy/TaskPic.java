package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public final class TaskPic {


    private static final String XSL_DIR = "pic/";

    static String process
            (
            HttpServletRequest request
            , HttpServletResponse response
            , HTMLRenderer HTMLmaker
            , Navigation nav
            , XMLDocument document
            ) throws NavigationException {
        String result = null;
        String command = null;
        String img = null;
        String xsldocURLString = null;
        String cacheKey = TCServlet.LOGGED_OUT_KEY;
        try {
            command = Conversion.checkNull(request.getParameter("c"));
            img = Conversion.checkNull(request.getParameter("img"));
            if (command.startsWith("member")) {
                document.addTag(new ValueTag("img", img));
            }
            result = TaskStatic.displayStatic(HTMLmaker, request, nav, document);
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskPic:process:");
            msg.append(command);
            msg.append(":ERROR:");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(),
                    TCServlet.XSL_ROOT + TCServlet.XSL_ROOT + TCServlet.NAVIGATION_ERROR_PAGE);
        }
        return result;
    }


}
