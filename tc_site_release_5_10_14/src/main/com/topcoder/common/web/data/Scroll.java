package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class Scroll implements Serializable, TagRenderer {

    private boolean Next;
    private int Row;
    private int Returns;
    private int Size;
    private boolean AllowPrevious;
    private boolean AllowNext;


    public Scroll() {
        Next = false;
        Row = 0;
        Returns = 0;
        Size = 0;
        AllowPrevious = false;
        AllowNext = false;
    }


    public Scroll(boolean Next, int Row, int Returns, int Size, boolean AllowPrevious, boolean AllowNext) {
        this.Next = Next;
        this.Row = Row;
        this.Returns = Returns;
        this.Size = Size;
        this.AllowPrevious = AllowPrevious;
        this.AllowNext = AllowNext;
    }


// set
    public void setNext(boolean Next) {
        this.Next = Next;
    }

    public void setRow(int Row) {
        this.Row = Row;
    }

    public void setReturns(int Returns) {
        this.Returns = Returns;
    }

    public void setSize(int Size) {
        this.Size = Size;
    }

    public void setAllowPrevious(boolean AllowPrevious) {
        this.AllowPrevious = AllowPrevious;
    }

    public void setAllowNext(boolean AllowNext) {
        this.AllowNext = AllowNext;
    }


// get
    public boolean getNext() {
        return Next;
    }

    public int getRow() {
        return Row;
    }

    public int getReturns() {
        return Returns;
    }

    public int getSize() {
        return Size;
    }

    public boolean getAllowPrevious() {
        return AllowPrevious;
    }

    public boolean getAllowNext() {
        return AllowNext;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Scroll");
            result.addTag(new ValueTag("Next", Next));
            result.addTag(new ValueTag("Row", Row));
            result.addTag(new ValueTag("Returns", Returns));
            result.addTag(new ValueTag("Size", Size));
            result.addTag(new ValueTag("AllowPrevious", AllowPrevious));
            result.addTag(new ValueTag("AllowNext", AllowNext));
        } catch (Exception e) {
            throw new Exception("common.web.data.Scroll:getXML:ERROR:" + e);
        }
        return result;
    }


}

