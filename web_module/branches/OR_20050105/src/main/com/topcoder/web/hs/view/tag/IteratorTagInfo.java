package com.topcoder.web.hs.view.tag;

import javax.servlet.jsp.tagext.*;

public class IteratorTagInfo extends TagExtraInfo {

  public VariableInfo[] getVariableInfo(TagData data) {
    VariableInfo[] vi=new VariableInfo[]{
      new VariableInfo(data.getId(),"java.lang.Object",true,VariableInfo.NESTED)
    };
    return(vi);
  }

};
