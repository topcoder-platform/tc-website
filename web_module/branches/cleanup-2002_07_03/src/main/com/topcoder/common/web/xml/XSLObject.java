package com.topcoder.common.web.xml;

import org.apache.xalan.xslt.StylesheetRoot;
import java.util.HashMap;
import com.topcoder.common.web.error.*;

public class XSLObject {

  private StylesheetRoot styleSheet;
  private HashMap htmlCache;

  ////////////////////////////////////////////////////////////////////////////////
  public XSLObject(StylesheetRoot styleSheet) {
  ////////////////////////////////////////////////////////////////////////////////
    setStylesheet(styleSheet);
    htmlCache = new HashMap(3);
  }

  ////////////////////////////////////////////////////////////////////////////////
  public StylesheetRoot getStylesheet() {
  ////////////////////////////////////////////////////////////////////////////////
    return this.styleSheet;
  }
  
  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setStylesheet(StylesheetRoot styleSheet) {
  ////////////////////////////////////////////////////////////////////////////////
    this.styleSheet = styleSheet;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public String getHTML(String cacheKey) {
  ////////////////////////////////////////////////////////////////////////////////
    String retVal = null;
    retVal = (String) htmlCache.get(cacheKey);
    return retVal;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void putHTML(String cacheKey, String HTMLString) 
    throws TCException
  ////////////////////////////////////////////////////////////////////////////////
  {
    try {
      htmlCache.put(cacheKey, HTMLString);
    }catch(Exception e) {
      e.printStackTrace();
      throw new TCException("ERROR: Could not cache HTML string.");
    }
  }
  
}
