package com.topcoder.common.web.xml;

import java.io.*;
import java.util.*;
import javax.naming.*;
import org.apache.xalan.xslt.*;
import org.xml.sax.SAXException;
import java.net.*;
import com.topcoder.common.Log;
import com.topcoder.common.web.error.*;
import com.topcoder.shared.docGen.xml.xsl.*;
import com.topcoder.shared.docGen.xml.XMLDocument;

public class HTMLRenderer {

  private static final boolean VERBOSE = false;

  public HTMLRenderer() {}

  /** 
   * Use the provided XML and file to generate html.
   * Note that cacheKey is not used.
   */
  public String render(XMLDocument xmldocObject, String xsldocURLString, String cacheKey) 
    throws TCException {

    ByteArrayOutputStream baos = null;
    XSLTransformerWrapper wrapper = null;
    XSLTransformerCache cache = null;

 
    try {
      cache = XSLTransformerCache.getInstance();
      wrapper = cache.getXSLTransformerWrapper(xsldocURLString);
      wrapper.transform(new StringReader(xmldocObject.createXML()), baos);
      return baos.toString();   

    } catch (Exception e) {
      throw new TCException("ejb.HTMLRenderer.HTMLRendererBean:render:ERROR:\n"+e);
    }
  }

  /**
  * Clears the cache.
  */
  public void refresh() throws TCException {
    XSLTransformerCache cache = null;
    try {
      cache = XSLTransformerCache.getInstance();
      cache.clear();
    }catch (Exception e) {
      e.printStackTrace();
      Log.msg("Error in HTMLRendererBean.refresh()");
    }  
  }
}
