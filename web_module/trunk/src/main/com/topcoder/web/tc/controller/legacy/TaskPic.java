package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.web.common.NavigationException;

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
        try {
            command = Conversion.checkNull(request.getParameter("c"));
            img = Conversion.checkNull(request.getParameter("img"));
            if (command.startsWith("member")) {
                document.addTag(new ValueTag("img", img));
            }
            result = TaskStatic.displayStatic(HTMLmaker, request, nav, document);
        } catch (Exception e) {
            throw new NavigationException(e);
        }
        return result;
    }


}
