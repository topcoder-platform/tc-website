package com.topcoder.shared.docGen.xml;

import java.io.*;
import java.util.*;
import java.sql.*;

public class RecordTag extends Tag
{
  private String name;
  private ArrayList elementList;

  //////////////////////////////////////////////////////////////////////////////// 
  public RecordTag () {
  //////////////////////////////////////////////////////////////////////////////// 
    elementList = new ArrayList();
  }
  
  //////////////////////////////////////////////////////////////////////////////// 
  public RecordTag (String name) {
  //////////////////////////////////////////////////////////////////////////////// 
    elementList = new ArrayList();
	this.name = name;
  }
  
  //////////////////////////////////////////////////////////////////////////////// 
  public void setName(String name) {
  //////////////////////////////////////////////////////////////////////////////// 
  	this.name = name;
  }
  
  //////////////////////////////////////////////////////////////////////////////// 
  public String getName() {
  //////////////////////////////////////////////////////////////////////////////// 
  	return this.name;
  }
  
  //////////////////////////////////////////////////////////////////////////////// 
  public void reset() {
  //////////////////////////////////////////////////////////////////////////////// 
    this.name = null;
	elementList.clear();
  }
  
  //////////////////////////////////////////////////////////////////////////////// 
  public void addTag (Tag tag)
  //////////////////////////////////////////////////////////////////////////////// 
  {
    elementList.add(tag);
  }

  //////////////////////////////////////////////////////////////////////////////// 
  public String getXML()
  //////////////////////////////////////////////////////////////////////////////// 
  {
    return createXML();
  }

  //////////////////////////////////////////////////////////////////////////////// 
  public String getXML(int offSet)
  //////////////////////////////////////////////////////////////////////////////// 
  {
    String result = null;
    try {
      if (offSet > 0)
        {result = createXML(offSet);}
      else
        {result = createXML();}
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }

  //////////////////////////////////////////////////////////////////////////////// 
  protected String createXML(int offSet)
  //////////////////////////////////////////////////////////////////////////////// 
  {

    StringBuffer retVal = new StringBuffer(64);
    try {
      String offSetString = createOffset(offSet);

      if (offSet > 0) { retVal.append(offSetString); }
      retVal.append("<");
      retVal.append(this.name);
      retVal.append(">\n");

      //Iterate through elementList appending the getXML outputs.
      for (int i = 0; i < elementList.size(); i++)
      {
        Tag tempTag = (Tag)elementList.get(i);
        retVal.append(tempTag.getXML(offSet+2));
      }

      if (offSet > 0) { retVal.append(offSetString); }
      retVal.append("</");
      retVal.append(this.name);
      retVal.append(">\n");
      offSetString = null;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return retVal.toString();
  }

  //////////////////////////////////////////////////////////////////////////////// 
  protected String createXML()
  //////////////////////////////////////////////////////////////////////////////// 
  {

    StringBuffer retVal = new StringBuffer(64);
    try {
      retVal.append("<");
      retVal.append(this.name);
      retVal.append(">\n");

      //Iterate through elementList appending the getXML outputs.
      for (int i = 0; i < elementList.size(); i++) {
        Tag tempTag = (Tag)elementList.get(i);
        retVal.append(tempTag.getXML());
      }
      retVal.append("</");
      retVal.append(this.name);
      retVal.append(">\n");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return retVal.toString();
  }

  //////////////////////////////////////////////////////////////////////////////// 
  private String createOffset(int offSet)
  //////////////////////////////////////////////////////////////////////////////// 
  {
    StringBuffer offSetString = new StringBuffer();
    try {
      for (int i = 0; i < offSet; i++)
      {
        offSetString.append(" ");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return offSetString.toString();
  }



  /**
   **********************************************************************************
   * createErrorTag()
   * Creates a record tag for a generic error page.
   * @author Greg Paul
   * @param message - the message
   * @return RecordTag - the tag we've created
   **********************************************************************************
   **/
  public static RecordTag createErrorTag(String message) {

    RecordTag result = new RecordTag("ERROR");

    if (message == null)
      result.addTag(new ValueTag("ErrorMessage", ""));
    else result.addTag(new ValueTag("ErrorMessage", message));

    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  public static final RecordTag getListXML(String tagName, List attrList)
    throws Exception {
  ////////////////////////////////////////////////////////////////////////////////
    RecordTag result = null;
    try {
      result = new RecordTag(tagName);
      if (attrList!=null) {
        for (int i=0; i< attrList.size(); i++) {
          TagRenderer attrObj = (TagRenderer) attrList.get(i);
          try {
            result.addTag( attrObj.getXML() );
          } catch(Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("common.web.xml.RecordTag:getListXML:");
            msg.append(tagName);
            msg.append(":ERROR:\n");
            msg.append(e);
            throw new Exception(msg.toString());
          }
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new Exception("common.web.xml.XMl:getListXML:ERROR:\n"+e);
    }
    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public static final RecordTag getCollectionXML(String tagName, Collection attrCollection)
    throws Exception {
  ////////////////////////////////////////////////////////////////////////////////
    RecordTag result = null;
    try {
      result = new RecordTag(tagName);
      if (attrCollection!=null) {
        for (Iterator i = attrCollection.iterator(); i.hasNext(); ) {
          TagRenderer attrObj = (TagRenderer) i.next();
          try {
            result.addTag( attrObj.getXML() );
          } catch(Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("common.web.xml.RecordTag:getListXML:");
            msg.append(tagName);
            msg.append(":ERROR:\n");
            msg.append(e);
            throw new Exception(msg.toString());
          }
        }
      }
    } catch (Exception e) {
      throw new Exception("common.web.xml.XMl:getCollectionXML:ERROR:\n"+e);
    }
    return result;
  }

}
