package com.topcoder.web.hs.view.tag;

import java.io.*;
import java.util.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

/**
 * Abstract class that presents a "SELECT" form input.
 *
 * @author Nathan Egge
 * @version 1.0 2003/1/7
 */
public abstract class Select extends TagSupport {

  private String name=null;

  private String css_class=null;

  private String on_change=null;

  private String selected_value=null;

  public void setName(String _name) {
    name=_name;
  }

  public void setClass(String _css_class) {
    css_class=_css_class;
  }

  public void setOnChange(String _on_change) {
    on_change=_on_change;
  }

  public void setSelected(String _selected_value) {
    selected_value=_selected_value;
  }

  public int doStartTag() throws JspException {
    return(Tag.SKIP_BODY);
  }

  public int doEndTag() throws JspException {
    try {
      JspWriter out=pageContext.getOut();
      out.write(buildSelect());
    }
    catch (IOException _ioe) {
      _ioe.printStackTrace();
      throw(new JspException(_ioe.getMessage()));
    }
    return(Tag.EVAL_PAGE);
  }

  String buildSelect() {
    return(buildSelect(getOptionsList()));
  }

  String buildSelect(List _options) {
    StringBuffer sb=new StringBuffer();
    sb.append("<SELECT");
    if (name!=null) {
      sb.append(" NAME=\""+name+"\"");
    }
    if (css_class!=null) {
      sb.append(" CLASS=\""+css_class+"\"");
    }
    if (on_change!=null) {
      sb.append(" ONCHANGE=\""+on_change+"\"");
    }
    sb.append(">\n");
    if (_options!=null) {
      for (Iterator i=_options.iterator();i.hasNext();) {
        Object option=i.next();
        String value=getOptionValue(option);
        String text=getOptionText(option);
        sb.append(" <OPTION VALUE=\""+value+"\"");
        if (selected_value!=null&&selected_value.equals(value)) {
          sb.append(" SELECTED");
        }
        sb.append(">"+text+"</OPTION>\n");
      }
    }
    sb.append("</SELECT>");
    return(sb.toString());
  }

  abstract String getOptionValue(Object _option);

  abstract String getOptionText(Object _option);

  abstract List getOptionsList();
};
