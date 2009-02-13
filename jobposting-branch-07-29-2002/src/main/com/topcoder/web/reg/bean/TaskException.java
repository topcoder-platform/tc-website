package com.topcoder.web.reg.bean;

public class TaskException
    extends Exception
//    extends TCException
{
    public TaskException()
    {
        super();
    }

    public TaskException(String message)
    {
        super(message);
    }

    public TaskException(Throwable t)
    {
        super(t.getMessage());
    }
}
