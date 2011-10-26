package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision: 66553 $ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 22, 2007
 */
public class MediaRequest extends BaseProcessor {
    public static final String FAX_NUMBER = "fax";
    public static final String MEDIA_TYPE = "medtype";
    public static final String MEDIA_OUTLET = "medout";
    public static final String ON_ASSIGNMENT = "onass";
    public static final String COMMENTS = "cmmts";

    private static final String[] requiredFields = {Constants.FIRST_NAME, Constants.LAST_NAME, Constants.EMAIL,
            Constants.PHONE_NUMBER, MEDIA_TYPE, MEDIA_OUTLET, ON_ASSIGNMENT};

    private static final String[] optionalFields = {FAX_NUMBER, Constants.TITLE, COMMENTS};

    private static final String[] allFields = new String[requiredFields.length + optionalFields.length];

    static {
        System.arraycopy(requiredFields, 0, allFields, 0, requiredFields.length);
        System.arraycopy(optionalFields, 0, allFields, requiredFields.length, optionalFields.length);
    }


    protected void businessProcessing() throws Exception {


        String givenName = StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME));
        String surname = StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME));
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));
        String phone = StringUtils.checkNull(getRequest().getParameter(Constants.PHONE_NUMBER));
        String fax = StringUtils.checkNull(getRequest().getParameter(FAX_NUMBER));
        String mediaType = StringUtils.checkNull(getRequest().getParameter(MEDIA_TYPE));
        String mediaOutlet = StringUtils.checkNull(getRequest().getParameter(MEDIA_OUTLET));
        String title = StringUtils.checkNull(getRequest().getParameter(Constants.TITLE));
        String onAss = StringUtils.checkNull(getRequest().getParameter(ON_ASSIGNMENT));
        String comments = StringUtils.checkNull(getRequest().getParameter(COMMENTS));


        for (String param : requiredFields) {
            if ("".equals(StringUtils.checkNull(getRequest().getParameter(param)).trim())) {
                addError(param, "This is a required field.");
            }
        }

        if (hasErrors()) {
            String val;
            for (String param : allFields) {
                val = getRequest().getParameter(param);
                if (val != null) {
                    setDefault(param, getRequest().getParameter(param));
                }
            }
            setNextPage("/pressroom/mediaRequestForm.jsp");
            setIsNextPageInContext(true);
        } else {

            StringBuilder buf = new StringBuilder(1000);
            buf.append("Given Name: ").append(givenName).append("\n");
            buf.append("Surname: ").append(surname).append("\n");
            buf.append("Email: ").append(email).append("\n");
            buf.append("Phone: ").append(phone).append("\n");
            buf.append("Fax: ").append(fax).append("\n");
            buf.append("Media Type: ").append(mediaType).append("\n");
            buf.append("Media Outlet: ").append(mediaOutlet).append("\n");
            buf.append("Title: ").append(title).append("\n");
            buf.append("On Assignment? ").append(onAss).append("\n");
            buf.append("Comments: ").append(comments);

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("Media Information Request");

            mail.setBody(buf.toString());

            if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
                mail.addToAddress("marketing@topcoder.com", TCSEmailMessage.TO);
            } else {
                mail.addToAddress("gpaul@topcoder.com", TCSEmailMessage.TO);
            }

            mail.setFromAddress("donotreply@topcoder.com");

            EmailEngine.send(mail);

            setNextPage(getSessionInfo().getServletPath() + "?" +
                    Constants.MODULE_KEY + "=Static&d1=pressroom&d2=mediaRequestFormSuccess");
            setIsNextPageInContext(false);


        }


    }
}
