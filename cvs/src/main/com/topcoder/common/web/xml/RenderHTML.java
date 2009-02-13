package com.topcoder.common.web.xml;

import java.io.*;
import java.util.*;
import javax.naming.*;
import org.apache.xalan.xslt.*;
import org.xml.sax.SAXException;
import java.net.*;
import com.topcoder.common.Log;
import com.topcoder.common.web.error.*;

public class RenderHTML {

  private static final boolean VERBOSE = false;
  private static XSLCache cache; 

  /////////////////////////////PUBLIC METHODS///////////////////////////  
  
  /**
  * Renders HTML to a PrintWriter output stream.
  * If the name is in the cache, return it.
  * If that name is not in the cache, attempt to get it from file system (or db?),
  * compile it, cache it, and return it.
  * If the XSL style sheet does not exist in the cache or on file, return null.
  *
  * @param xsldocURLString  the String representation of a XSL file URL.
  * @return         a handle to an instance of StylesheetRoot.
  * @see  common.XMLDocument
  *
  */
  //////////////////////////////////////////////////////////////////////////////// 
  public RenderHTML()
  //////////////////////////////////////////////////////////////////////////////// 
  {
    RenderHTML.cache = new XSLCache();
  }

  //////////////////////////////////////////////////////////////////////////////// 
  public String render(XMLDocument xmldocObject, String xsldocURLString, String cacheKey) 
    throws TCException 
  //////////////////////////////////////////////////////////////////////////////// 
  {
    try {

      XSLObject xslObject = null;
      xslObject = (XSLObject) cache.getXSLObject(xsldocURLString);
      String HTMLString = "";

      if (xslObject == null)
      {
        Log.msg("Object not cached... processing.");
        // load the XSL file and get the stylesheet object
        StylesheetRoot styleSheet = loadFromURL(xsldocURLString);
        xslObject = new XSLObject(styleSheet);

        // process the document
        HTMLString = processXSL(styleSheet, xmldocObject.getXML());

        // cache the HTML (if static doc)
        if (cacheKey != null)
        {
          xslObject.putHTML(cacheKey, HTMLString);
        }

        cache.putXSLObject(xsldocURLString, xslObject);

      }
      else
      {
        if (cacheKey != null)
        {
          HTMLString = xslObject.getHTML(cacheKey);
          if (HTMLString == null)
          {
            StylesheetRoot styleSheet = xslObject.getStylesheet();
            HTMLString = processXSL(styleSheet, xmldocObject.getXML());
            if (HTMLString != null && HTMLString.length() > 0)
            {
              xslObject.putHTML(cacheKey, HTMLString);
            }
          }
        }
        else
        {
          StylesheetRoot styleSheet = xslObject.getStylesheet();
          HTMLString = processXSL(styleSheet, xmldocObject.getXML());
        }
      }

      xslObject = null;
      return HTMLString;

    } catch (Exception e) {
      throw new TCException("ejb.RenderHTML.RenderHTMLBean:render:ERROR:\n"+e);
    }
  }

  ////////////////////////////////////////////////////////////////////////////////
  public String getHTML(String xsldocURLString, String cacheKey)
  ////////////////////////////////////////////////////////////////////////////////
  {
    String retVal = null;

    try{
      XSLObject xslObject = (XSLObject) cache.getXSLObject(xsldocURLString);
      if (xslObject == null)
      { 
        retVal = null;  
      }
      else
      {
        retVal = xslObject.getHTML(cacheKey);
      }
    }catch(TCException e){
      retVal = null;
    }

    return retVal;
  }
  
  
  /**
  * Removes all compiled style sheets in the XSLCache.
  *
  * @see  common.XSLCache
  *
  */
  //////////////////////////////////////////////////////////////////////////////// 
  public void refresh() throws TCException
  //////////////////////////////////////////////////////////////////////////////// 
  {
    try {
      if ( !cache.isEmpty() ) cache.clear();
    }catch (Exception e) {
      e.printStackTrace();
      Log.msg("Error in RenderHTMLBean.refresh()");
    }  
  }
  
  
  /**
  * Removes a specified style sheet from the XSLCache.
  *
  * @param xsldocURLString  the String representation of a XSL file URL.
  * @see  common.XSLCache
  *
  */ 
  //////////////////////////////////////////////////////////////////////////////// 
  public void refresh(String xsldocURLString) throws TCException
  //////////////////////////////////////////////////////////////////////////////// 
  {
    try {
      cache.remove(xsldocURLString);
    }catch (Exception e) {
      e.printStackTrace();
      Log.msg("Error in RenderHTMLBean.refresh(" + xsldocURLString + ")");
    }  
  }  
  
  
  /////////////////////////////PRIVATE METHODS///////////////////////////  
  
  //If the file represented by the String xsldocURLString exists, process the XSL file with 
  //the XSLTProcessor.  Return the processed XSL StylesheetRoot.
  //////////////////////////////////////////////////////////////////////////////// 
  private StylesheetRoot loadFromURL ( String xsldocURLString ) 
    throws MalformedURLException, IOException 
  //////////////////////////////////////////////////////////////////////////////// 
  {
    StylesheetRoot compiledXSL = null;
    XSLTProcessor processor = null;
    try {
      URL url = new URL(xsldocURLString);
      InputStream urlStream = url.openStream();
      if (urlStream == null) {
        throw new TCException("Invalid XSL document.");
      } else {
        urlStream.close();
        urlStream = null;
        processor = XSLTProcessorFactory.getProcessor();
        compiledXSL = processor.processStylesheet(xsldocURLString);
        processor = null;
      }
    } catch ( MalformedURLException me ) {
      Log.msg("MalformedURLException in RenderHTMLBean.loadFromURL(\"" + xsldocURLString + "\") FILE NOT CACHED");
    } catch ( IOException ie ) {
      Log.msg("IOException in RenderHTMLBean.loadFromURL(\"" + xsldocURLString + "\") FILE NOT CACHED");
    } catch ( Exception e ) {
      e.printStackTrace();
      Log.msg("IOException in RenderHTMLBean.loadFromURL(\"" + xsldocURLString + "\") FILE NOT CACHED");
    }  
    return compiledXSL;
  }

  //////////////////////////////////////////////////////////////////////////////// 
  private String processXSL(StylesheetRoot styleSheet, String XMLString)
    throws TCException
  //////////////////////////////////////////////////////////////////////////////// 
  {
    String retVal = null;
    CharArrayWriter caw = null;
    StringReader xmlStream = null;
    XSLTInputSource inputStream = null;
    XSLTResultTarget outputStream = null;
    XSLTProcessor processor = null;

    try{
      caw = new CharArrayWriter(2048);
      xmlStream = new StringReader( XMLString );
      inputStream = new XSLTInputSource(xmlStream);
      outputStream = new XSLTResultTarget(caw);
      processor = XSLTProcessorFactory.getProcessor();
      styleSheet.process(processor, inputStream, outputStream);
      retVal = caw.toString(); 
    } catch(Exception e){
      e.printStackTrace();
      throw new TCException("RenderHTML:processXSL:ERROR:\n"+e);
    } finally {
      caw.close();
      xmlStream.close();
      outputStream = null;
      styleSheet = null;
      inputStream = null;
      xmlStream = null;
      processor = null;
      caw = null;
    }
    return retVal;
  }
  
}
