package com.topcoder.web.tc.model;

import java.util.List;
import java.io.Serializable;

public class ProblemRatingResult implements Serializable {
    String question;
    double avg;

    public ProblemRatingResult() {}
    public ProblemRatingResult(String question,double avg){
        this.question = question;
        this.avg = avg;
    }

    public double getAvg(){
        return avg;
    }
    public void setAvg(double avg){
        this.avg = avg;
    }
    public String getQuestion(){
        return question;
    }
    public void setQuestion(String question){
        this.question = question;
    }
}
