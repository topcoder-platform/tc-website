package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.ApplicationServer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public final class TaskSponsor {


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
        String refer = null;
        String link = null;
        javax.naming.Context ctx = null;
        try {
            command = Conversion.checkNull(request.getParameter("c"));
            link = Conversion.checkNull(request.getParameter("link"));
            document.addTag(new ValueTag("link", link));
            refer = Conversion.checkNull(request.getParameter("refer"));
            String ip = request.getRemoteHost();
            if (
                    !(
                    ip.equals("65.112.118.193")
                    || ip.equals("65.112.118.193")
                    || ip.equals("65.112.118.194")
                    || ip.equals("65.112.118.195")
                    || ip.equals("65.112.118.196")
                    || ip.equals("65.112.118.197")
                    || ip.equals("65.112.118.210")
                    )
            ) {
                ctx = new javax.naming.InitialContext();
                com.topcoder.ejb.Util.UtilHome utilHome = (com.topcoder.ejb.Util.UtilHome) ctx.lookup(ApplicationServer.UTIL);
                com.topcoder.ejb.Util.Util util = utilHome.create();
                util.incrementSponsorHitCount(link, refer);
            }
            result = TaskStatic.displayStatic(HTMLmaker, request, nav, document);
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskSponsor:process:");
            msg.append(command);
            msg.append(":ERROR:");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(),
                    TCServlet.XSL_ROOT + TCServlet.XSL_ROOT + TCServlet.NAVIGATION_ERROR_PAGE);
        }
        return result;
    }


}
