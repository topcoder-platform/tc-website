package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.error.*;


public final class ContestTextType implements Serializable, Base {
  private String TextType;
  private String TextTypeDesc;

  public ContestTextType() {
    TextType = "";
    TextTypeDesc = "";
  }

// set
  public void setTextType(String TextType) {
    this.TextType = TextType;
  }

  public void setTextTypeDesc(String TextTypeDesc) {
    this.TextTypeDesc = TextTypeDesc;
  }

// get
  public String getTextType() {
    return TextType;
  }

  public String getTextTypeDesc() {
    return TextTypeDesc;
  }
  
  public RecordTag getXML() throws TCException {
    RecordTag result = null;
    try {
      result = new RecordTag("ContestTextType");
      result.addTag( new ValueTag("TextType", TextType) );
      result.addTag( new ValueTag("TextTypeDesc", TextTypeDesc) );
    }catch (Exception e)  {
      throw new TCException("common.web.data.ContestTextType getXML ERROR: " + e);
    }
    return result;
  }
}

