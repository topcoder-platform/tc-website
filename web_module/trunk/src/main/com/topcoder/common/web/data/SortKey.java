package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public final class SortKey implements Serializable, TagRenderer {

    private int key;
    private char dir;


    public SortKey() {
        key = 0;
        dir = 'A';
    }


    public SortKey(int key, char dir) {
        this.key = key;
        this.dir = dir;
    }


// set
    public void setKey(int key) {
        this.key = key;
    }

    public void setDir(char dir) {
        this.dir = dir;
    }


// get
    public int getKey() {
        return key;
    }

    public char getDir() {
        return dir;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("SortKey");
            result.addTag(new ValueTag("Key", key));
            result.addTag(new ValueTag("Dir", new Character(dir)));
        } catch (Exception e) {
            throw new Exception("common.web.data.SortKey.getXML ERROR:" + e);
        }
        return result;
    }


}

