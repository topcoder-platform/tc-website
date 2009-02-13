package com.topcoder.shared.problem;

import java.util.ArrayList;
import java.io.*;
import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;
import com.topcoder.shared.netCommon.CustomSerializable;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.language.Language;

/**
 * This class contains data for a problem.  Each problem consists of a number of
 * components.  The actual program interface data (className, etc.) of each component is 
 * contained in <code>ProblemComponent</code> objects.  For single-coder contests, each problem
 * has only one component.
 *
 * <code>Note</code>: the deprecated methods on this class are relics for supporting
 * conventional single-coder contests.  Callers of this class are advised to use their
 * replacements on the <code>ProblemComponent</code> class to retrieve the interface data, even
 * for single-coder contests where each problem has only one component.  Those methods
 * will be removed once there is nobody calling them any more.
 *
 * @author Jing Xue
 * @author Hao Kung 
 */
public class Problem implements Element, Serializable, CustomSerializable 
{
  private ProblemComponent[] problemComponents = new ProblemComponent[0];
  private int problemId = -1;
  private String name = "";
  private int problemTypeID = -1;
  private String problemText = "";

  public final String getCacheKey() 
  {
    return "Problem."+problemId;
  }

  public Problem ()
  {
  }

  public static String getCacheKey(int problemid) 
  {
    return "Problem."+problemid;
  }

  public void customWriteObject(CSWriter writer) throws IOException
  {
      writer.writeInt(problemComponents.length);
      for(int i = 0; i<problemComponents.length;i++)
        writer.writeObject(problemComponents[i]);
      writer.writeInt(problemId);
      writer.writeString(name);
      writer.writeInt(problemTypeID);
      writer.writeString(problemText);
  }

  public void customReadObject(CSReader reader) throws IOException, ObjectStreamException
  {
      int count = reader.readInt();
      problemComponents = new ProblemComponent[count];
      for(int i = 0; i<count;i++)
        problemComponents[i] = (ProblemComponent)reader.readObject();
      problemId = reader.readInt();
      name = reader.readString();
      problemTypeID = reader.readInt();
      problemText = reader.readString();
  }



  public void setProblemId(int problemId)
  {
      this.problemId = problemId;
  }

  public int getProblemId()
  {
      return this.problemId;
  }

  public Object clone()
  {
      Problem p = new Problem();
      p.setProblemId(problemId);
      p.setProblemText(problemText);
      p.setProblemComponents(problemComponents);
      return p;
  }

  public void setName(String name){
      this.name = name;
  }
  public String getName(){
      return name;
  }

  public String getProblemText() {
    return problemText;
  }

  public void setProblemText(String problemText) {
    this.problemText = problemText;
  }

  public ProblemComponent[] getProblemComponents() {
    return problemComponents;
  }
  public void setProblemComponents(ProblemComponent[] problemComponents) {
    this.problemComponents = problemComponents;
  }

  public int getProblemTypeID() {
    return problemTypeID;
  }

  public void setProblemTypeID(int problemTypeID) {
    this.problemTypeID = problemTypeID;
  }
  public ProblemComponent getComponent(int i){
    if(i>=problemComponents.length)return null;
    return problemComponents[i];
  }
    public String toString(){
        StringBuffer ret = new StringBuffer(1000);
        ret.append("(com.topcoder.shared.problem.Problem) [");
        ret.append("problemComponents = ");
        if(problemComponents == null){
            ret.append("null");
        } else {
            ret.append("{");
            for(int i = 0; i<problemComponents.length;i++){
                ret.append(problemComponents[i].toString()+",");
            }
            ret.append("}");
        }
        ret.append(", ");
        ret.append("problemId = ");
        ret.append(problemId);
        ret.append(", ");
        ret.append("name = ");
        if(name == null){
            ret.append("null");
        } else {
            ret.append(name.toString());
        }
        ret.append(", ");
        ret.append("problemTypeID = ");
        ret.append(problemTypeID);
        ret.append(", ");
        ret.append("problemText = ");
        if(problemText == null){
            ret.append("null");
        } else {
            ret.append(problemText.toString());
        }
        ret.append(", ");
        ret.append("]");
        return ret.toString();
    }

  public String toHTML(Language language)
  {
    StringBuffer html = new StringBuffer("<html><body bgcolor='black' text='white'>");
    if(!problemText.equals(""))
    {
      html.append(ProblemComponent.encodeHTML(problemText));
      html.append("<hr>");
    }
    for(int i = 0; i < problemComponents.length ; i++)
    {
      html.append(problemComponents[i].toHTML(language));
      html.append("<hr>");
    }
    html.append("</body></html>");
    return html.toString();
  }

  public String toHTML(Language language, boolean includeHeader) {
    StringBuffer html = new StringBuffer();
    if(includeHeader) {
      html.append("<html><body bgcolor='black' text='white'>");
    }
    if(!problemText.equals("")) {
      html.append(ProblemComponent.encodeHTML(problemText));
        html.append("<hr>");
    }
    for(int i = 0; i < problemComponents.length ; i++) {
      html.append(problemComponents[i].toHTML(language));
        html.append("<hr>");
    }
    if(includeHeader) {
      html.append("</body></html>");
    }
    return html.toString();
  }

  public String toXML()
  {
    StringBuffer xml = new StringBuffer();
    return xml.toString();
  }

  /** Problem statement is valid if all the components are.*/
  public boolean isValid()
  {
    boolean valid = true;
    for(int i = 0; i < problemComponents.length; i++)
    {
      valid = valid && problemComponents[i].isValid();
    }
    return valid;
  }
}



