package com.topcoder.web.hs.model;

import java.io.*;

public class ListPairBean implements Serializable {

  private String value=null;

  private String text=null;

  public ListPairBean() {
    /* do nothing */
  }

  public ListPairBean(String _value,String _text) {
    value=_value;
    text=_text;
  }

  public String getValue() {
    return(value);
  }

  public void setValue(String _value) {
    value=_value;
  }

  public String getText() {
    return(text);
  }

  public void setText(String _text) {
    text=_text;
  }
};
