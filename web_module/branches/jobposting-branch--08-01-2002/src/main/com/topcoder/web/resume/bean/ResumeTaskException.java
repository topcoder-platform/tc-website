package com.topcoder.web.resume.bean;

public class ResumeTaskException extends Exception {
    ResumeTaskException(String s){
        super(s);
    }
    ResumeTaskException(Exception e){
        super(e);
    }
    ResumeTaskException(){
        super();
    }
}
