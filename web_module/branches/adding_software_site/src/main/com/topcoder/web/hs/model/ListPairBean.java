package com.topcoder.web.hs.model;

import java.io.*;

public class ListPairBean implements Serializable {

  private Object value=null;

  private Object text=null;

  public ListPairBean() {
    /* do nothing */
  }

  public ListPairBean(Object _value,Object _text) {
    value=_value;
    text=_text;
  }

  public Object getValue() {
    return(value);
  }

  public void setValue(Object _value) {
    value=_value;
  }

  public Object getText() {
    return(text);
  }

  public void setText(Object _text) {
    text=_text;
  }
};
