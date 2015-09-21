package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.Constants;
import com.topcoder.web.common.*;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.http.HttpServletResponse;

/**
 * @author VolodymyrK
 * Create Date: May 18, 2011
 */
public class DownloadVCard extends Base {

    protected void businessProcessing() throws Exception {
        String userId = getRequest().getParameter(Constants.USER_ID);

        if (!getSessionInfo().isAdmin()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        Request dataRequest = new Request();
        dataRequest.setContentHandle("member_vcard");
        dataRequest.setProperty(Constants.USER_ID, userId);
        DataAccessInt dai = getDataAccess(false);

        ResultSetContainer rsc = dai.getData(dataRequest).get("member_vcard");

        getResponse().setContentType("text/x-vcard");
        getResponse().addHeader("content-disposition", "inline;filename=\"" + rsc.getStringItem(0, "handle") + ".vcf\"");

        getResponse().getWriter().println("BEGIN:VCARD");
        getResponse().getWriter().println("VERSION:3.0");
        getResponse().getWriter().println("N:" + rsc.getStringItem(0, "last_name") + ";" + rsc.getStringItem(0, "first_name"));
        getResponse().getWriter().println("FN:" + rsc.getStringItem(0, "first_name") + " " + rsc.getStringItem(0, "last_name"));
        getResponse().getWriter().println("NICKNAME:" + rsc.getStringItem(0, "handle"));
        getResponse().getWriter().println("EMAIL;TYPE=PREF,INTERNET:" + rsc.getStringItem(0, "email_address"));
        if (rsc.getStringItem(0, "home_phone")!=null && rsc.getStringItem(0, "home_phone").trim().length()>0) {
            getResponse().getWriter().println("TEL;TYPE=HOME,VOICE:" + rsc.getStringItem(0, "home_phone"));
        }
        getResponse().getWriter().println("END:VCARD");

        getResponse().flushBuffer();
    }
}
