package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class Editor implements Serializable, TagRenderer {


    private int editorId;
    private String editorDesc;


    public Editor() {
        editorId = 0;
        editorDesc = "";
    }


    //Set
    public void setEditorId(int editorId) {
        this.editorId = editorId;
    }

    public void setEditorDesc(String editorDesc) {
        this.editorDesc = editorDesc;
    }


    // Get
    public int getEditorId() {
        return editorId;
    }

    public String getEditorDesc() {
        return editorDesc;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Editor");
            result.addTag(new ValueTag("EditorId", editorId));
            result.addTag(new ValueTag("EditorDesc", editorDesc));
        } catch (Exception e) {
            throw new Exception("common.web.data.Editor:getEditorXML:ERROR:\n" + e);
        }
        return result;
    }

}
