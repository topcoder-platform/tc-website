package com.topcoder.web.resume.bean;

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
    public Exception getCause() {
        return ex;
    }
    public void printStackTrace(){
        ex.printStackTrace();
    }
}
