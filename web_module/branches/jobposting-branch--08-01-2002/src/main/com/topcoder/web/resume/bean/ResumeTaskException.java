package com.topcoder.web.resume.bean;

public class ResumeTaskException extends Exception {
    ResumeTaskException(String s){
        super(s);
    }
    ResumeTaskException(Exception e){
        super(e.getMessage());
        setStackTrace(e.getStackTrace());
    }
    ResumeTaskException(){
        super();
    }
}
