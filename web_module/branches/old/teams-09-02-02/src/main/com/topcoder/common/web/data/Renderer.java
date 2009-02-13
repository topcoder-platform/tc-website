package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class Renderer
        implements
        Serializable
        , TagRenderer
        //,Comparable
        //,Cloneable
        //,Modifiable
{

    private int rendererId;
    private String rendererDesc;
    private String status;
    private String modified;

    public Renderer() {
        rendererDesc = "";
        modified = "";
        status = "";
        rendererId = 0;
    }

/*
  public boolean equals ( Object other ) {
    boolean result = false;
    Renderer otherRenderer = (Renderer) other;
    if (
      getRendererDesc().equals ( otherRenderer.getRendererDesc() )
      && getCity().equals ( otherRenderer.getCity() )
      && getState().getStateCode().equals ( otherRenderer.getState().getStateCode() )
      && getCountry().getCountryCode().equals ( otherRenderer.getCountry().getCountryCode() )
      && getRendererId() == otherRenderer.getRendererId()
      && getRendererId() == otherRenderer.getRendererId()
      && getSortLetter().equals ( otherRenderer.getSortLetter() )
    ) {
      result = true;
    }
    return result;
  }
*/


/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Renderer result = null;
    try {
      result = new Renderer();
      result.setRendererId( getRendererId() );
      result.setRendererId( getRendererId() );
      result.setRendererDesc( getRendererDesc() );
      result.setSortLetter( getSortLetter() );
      result.setCity( getCity() );
      result.setState( (State)getState().clone() );
      result.setCountry( (Country)getCountry().clone() );
      result.setModified( getModified() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
*/

/*
  public int compareTo(Object other) {
    Renderer otherRenderer = (Renderer) other;
    StringBuffer temp = new StringBuffer(132);
    char[] beginRendererDesc = new char[4];
    temp.append(this.getSortLetter());
    temp.append(this.getRendererDesc());
    if (temp.length() > 5) {
      temp.getChars(1,5,beginRendererDesc,0);
      if (beginRendererDesc[0]=='T' && beginRendererDesc[1]=='h' && beginRendererDesc[2]=='e' && beginRendererDesc[3]==' ') {
        temp.delete(1,5);
      }
    }
    String thisComparator = temp.toString();
    temp.delete(0, temp.length());
    temp.append(otherRenderer.getSortLetter());
    temp.append(otherRenderer.getRendererDesc());
    if (temp.length() > 5) {
      temp.getChars(1,5,beginRendererDesc,0);
      if (beginRendererDesc[0]=='T' && beginRendererDesc[1]=='h' && beginRendererDesc[2]=='e' && beginRendererDesc[3]==' ') {
        temp.delete(1,5);
      }
    }
    String otherComparator = temp.toString();
    return thisComparator.compareToIgnoreCase( otherComparator );
  }
*/

/*
  public void setAllModifiedStable() throws Exception {
    setModified("S");
  }
*/


// set

    public void setRendererDesc(String rendererDesc) {
        this.rendererDesc = rendererDesc;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setRendererId(int rendererId) {
        this.rendererId = rendererId;
    }

// get

    public String getRendererDesc() {
        return rendererDesc;
    }

    public String getStatus() {
        return status;
    }

    public String getModified() {
        return modified;
    }

    public int getRendererId() {
        return rendererId;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Renderer");
            result.addTag(new ValueTag("RendererId", rendererId));
            result.addTag(new ValueTag("RendererDesc", rendererDesc));
            result.addTag(new ValueTag("Status", status));
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Renderer getXML ERROR: " + e);
        }
        return result;
    }

}
