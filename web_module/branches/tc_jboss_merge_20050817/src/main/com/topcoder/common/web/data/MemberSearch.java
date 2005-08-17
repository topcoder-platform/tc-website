package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public class MemberSearch implements TagRenderer, Serializable {

    private String handle;
    private String state;
    private int minRating;
    private int maxRating;
    private int minNumRatings;
    private int maxNumRatings;
    private int monthsSinceLastComp;
    private Scroll scroll;
    private boolean isResult;
    private ArrayList coders;

    public MemberSearch() {
        handle = "";
        state = "";
        minRating = 0;
        maxRating = 0;
        minNumRatings = 0;
        maxNumRatings = 0;
        monthsSinceLastComp = 0;
        scroll = new Scroll();
        isResult = false;
        coders = new ArrayList();
    }


//sets

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setMinRating(int minRating) {
        this.minRating = minRating;
    }

    public void setMaxRating(int maxRating) {
        this.maxRating = maxRating;
    }

    public void setMinNumRatings(int minNumRatings) {
        this.minNumRatings = minNumRatings;
    }

    public void setMaxNumRatings(int maxNumRatings) {
        this.maxNumRatings = maxNumRatings;
    }

    public void setScroll(Scroll scroll) {
        this.scroll = scroll;
    }

    public void setIsResult(boolean isResult) {
        this.isResult = isResult;
    }

    public void setCoders(ArrayList coders) {
        this.coders = coders;
    }

    public void setMonthsSinceLastComp(int monthsSinceLastComp) {
        this.monthsSinceLastComp = monthsSinceLastComp;
    }
//gets

    public String getHandle() {
        return this.handle;
    }

    public String getState() {
        return this.state;
    }

    public int getMinRating() {
        return this.minRating;
    }

    public int getMaxRating() {
        return this.maxRating;
    }

    public int getMinNumRatings() {
        return this.minNumRatings;
    }

    public int getMaxNumRatings() {
        return this.maxNumRatings;
    }

    public Scroll getScroll() {
        return scroll;
    }

    public boolean getIsResult() {
        return isResult;
    }

    public ArrayList getCoders() {
        return this.coders;
    }

    public int getMonthsSinceLastComp() {
        return monthsSinceLastComp;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("MemberSearch");
            result.addTag(new ValueTag("Handle", handle));
            result.addTag(new ValueTag("State", state));
            result.addTag(new ValueTag("MinRating", minRating));
            result.addTag(new ValueTag("MaxRating", maxRating));
            result.addTag(new ValueTag("MinNumRatings", minNumRatings));
            result.addTag(new ValueTag("MaxNumRatings", maxNumRatings));
            result.addTag(new ValueTag("MonthsSinceLastComp", monthsSinceLastComp));
            result.addTag(new ValueTag("IsResult", isResult));
            result.addTag(scroll.getXML());
            result.addTag(RecordTag.getListXML("CoderList", coders));
        } catch (Exception e) {
            throw new Exception("common.MemberSearch:getXML:ERROR:\n" + e);
        }
        return result;
    }

}

