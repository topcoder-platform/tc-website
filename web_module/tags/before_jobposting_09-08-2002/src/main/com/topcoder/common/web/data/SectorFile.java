package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public class SectorFile implements Serializable, TagRenderer {

    private int SectorId;
    private String Name;
    private String System;
    private String Status;

    public SectorFile() {
        SectorId = 0;
        Name = "";
        System = "";
        Status = "";
    }

    public SectorFile(int SectorId, String Name, String System, String Status) {
        this.SectorId = SectorId;
        this.Name = Name;
        this.System = System;
        this.Status = Status;
    }

    //Set
    public void setSectorId(int SectorId) {
        this.SectorId = SectorId;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setSystem(String System) {
        this.System = System;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    // Get
    public int getSectorId() {
        return SectorId;
    }

    public String getName() {
        return Name;
    }

    public String getSystem() {
        return System;
    }

    public String getStatus() {
        return Status;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("SectorFile");
            result.addTag(new ValueTag("SectorId", SectorId));
            result.addTag(new ValueTag("Name", Name));
            result.addTag(new ValueTag("System", System));
            result.addTag(new ValueTag("Status", Status));
        } catch (Exception e) {
            throw new Exception("common.web.data.SectorFile getXML ERROR: " + e);
        }
        return result;
    }


}

