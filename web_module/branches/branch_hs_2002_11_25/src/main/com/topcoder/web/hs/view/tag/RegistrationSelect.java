package com.topcoder.web.hs.view.tag;

import com.topcoder.web.hs.model.ListPairBean;

import java.util.*;

public class RegistrationSelect extends Select {

  private List list;

  public RegistrationSelect() {
    super();
  }

  public void setList(List _list) {
    list=_list;
  }

  public String getOptionValue(Object _option) {
    return(((ListPairBean)_option).getValue());
  }

  public String getOptionText(Object _option) {
    return(((ListPairBean)_option).getText());
  }

  public List getOptionsList() {
    return(list);
  }
};
