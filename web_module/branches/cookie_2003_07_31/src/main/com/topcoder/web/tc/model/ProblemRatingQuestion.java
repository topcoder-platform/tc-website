package com.topcoder.web.tc.model;

import java.io.Serializable;

public class ProblemRatingQuestion implements Serializable{
    public int id;
    public String question;
    public ProblemRatingQuestion(){
    }
    public String getQuestion(){
        return question;
    }
    public int getID(){
        return id;
    }

    public void setQuestion(String question){
        this.question = question;
    }
    public void setID(int id){
        this.id = id;
    }
}
