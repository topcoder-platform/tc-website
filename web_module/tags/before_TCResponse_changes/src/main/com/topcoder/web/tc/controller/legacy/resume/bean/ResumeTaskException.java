package com.topcoder.web.tc.controller.legacy.resume.bean;

public class ResumeTaskException extends Exception {
    private Exception ex = null;
    ResumeTaskException(String s){
        super(s);
        ex = this;
    }
    ResumeTaskException(Exception e){
        super(e.getMessage());
        ex = e;
    }
    ResumeTaskException(){
        super();
        ex=this;
    }
    public Throwable getCause() {
        return ex;
    }
    public void printStackTrace(){
        if(ex==this)super.printStackTrace();
        else ex.printStackTrace();
    }
}
