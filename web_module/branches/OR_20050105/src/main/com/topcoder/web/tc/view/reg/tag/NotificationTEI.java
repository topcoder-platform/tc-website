package com.topcoder.web.tc.view.reg.tag;

import javax.servlet.jsp.tagext.*;

public class NotificationTEI
        extends TagExtraInfo {
    public VariableInfo[] getVariableInfo(TagData data) {
        VariableInfo[] variableInfo = new VariableInfo[]
        {
            new VariableInfo(Notification.NOTIFY_ID, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(Notification.NOTIFY_NAME, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(Notification.NOTIFY, String.class.getName(), true, VariableInfo.NESTED)
        };

        return variableInfo;
    }
}
