package com.topcoder.web.email.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.bean.AddressListTask;
import com.topcoder.web.email.bean.MemberData;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.Iterator;
import java.util.Map;

/**
 * Custom tag to display member data for a specified
 * member ID of a given addressList ID.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */


public class MemberDataDisplayTag
        extends TagSupport {
    private static Logger log = Logger.getLogger(MemberDataDisplayTag.class);

    protected int memberID;
    protected int addressListID;

    public void setMemberID(String memberID) {
        try {
            this.memberID = Integer.parseInt(memberID);
        } catch (NumberFormatException e) {
            this.memberID = -1;
        }
    }

    public String getMemberID() {
        return String.valueOf(memberID);
    }

    public void setAddressListID(String addressListID) {
        try {
            this.addressListID = Integer.parseInt(addressListID);
        } catch (NumberFormatException e) {
            this.addressListID = -1;
        }
    }

    public String getAddressListID() {
        return String.valueOf(addressListID);
    }


    public int doStartTag()
            throws JspException {
        return SKIP_BODY;
    }

    public int doEndTag()
            throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.write(buildHTML());
        } catch (Exception e) {
            throw new JspException(e.toString());
        }
        return EVAL_PAGE;
    }

    String buildHTML()
            throws Exception {
        StringBuffer sb = new StringBuffer(2000);

        String memberXML = AddressListTask.getMemberDataText(addressListID, memberID);

        MemberData memberData = MemberData.loadFromXML(memberXML);
        Map fieldValueMap = memberData.getFieldValueMap();

        for (Iterator i = fieldValueMap.keySet().iterator(); i.hasNext();) {
            String field = i.next().toString();
            sb.append("<b>");
            sb.append(field);
            sb.append(":</b> ");
            sb.append(fieldValueMap.get(field));
            sb.append("<br>\n");
        }

        return sb.toString();
    }

}
