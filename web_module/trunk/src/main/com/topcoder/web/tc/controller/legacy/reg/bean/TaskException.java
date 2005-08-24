package com.topcoder.web.tc.controller.legacy.reg.bean;

import com.topcoder.web.common.TCWebException;

public class TaskException
        extends TCWebException
//    extends TCException
{
    public TaskException() {
        super();
    }

    public TaskException(String message) {
        super(message);
    }

    public TaskException(Throwable t) {
        super(t);
    }
}
