package com.topcoder.shared.problem;

import com.topcoder.shared.language.Language;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

import java.util.ArrayList;

/**
 * A user constraint is where the problem writer writes arbitrary text to specify
 * a constraint.  This class is basically just a container for some <code>Element</code>.
 *
 * @see Element
 * @author Logan Hanks
 */
public class UserConstraint
    extends Constraint
{
    private Element elem;
    private String text;

    public UserConstraint()
    {
    }

    public UserConstraint(String text)
    {
        super("");

        this.text = text;
    }

    public UserConstraint(Element elem)
    {
        super("");

        this.elem = elem;
        if(elem instanceof NodeElement) {
            ArrayList elems = ((NodeElement)elem).getChildren();
            StringBuffer buf = new StringBuffer(128);

            for(int i = 0; i < elems.size(); i++)
                buf.append(((Element)elems.get(i)).toXML());
            text = buf.toString();
        } else
            text = elem.toXML();
    }

    public void customWriteObject(CSWriter writer)
        throws IOException
    {
        super.customWriteObject(writer);
        writer.writeObject(elem);
        if(elem == null)
            writer.writeString(text);
    }

    public void customReadObject(CSReader reader)
        throws IOException, ObjectStreamException
    {
        super.customReadObject(reader);
        elem = (Element)reader.readObject();
        if(elem instanceof NodeElement) {
            ArrayList elems = ((NodeElement)elem).getChildren();
            StringBuffer buf = new StringBuffer(128);

            for(int i = 0; i < elems.size(); i++)
                buf.append(((Element)elems.get(i)).toXML());
            text = buf.toString();
        } else if(elem != null)
            text = elem.toXML();
        else
            text = reader.readString();
    }

    public String toHTML(Language language)
    {
        if(elem instanceof NodeElement) {
            ArrayList elems = ((NodeElement)elem).getChildren();
            StringBuffer buf = new StringBuffer(64 * elems.size());

            buf.append("<li>");
            for(int i = 0; i < elems.size(); i++)
                buf.append(((Element)elems.get(i)).toHTML(language));
            return buf.toString();
        } else {
            StringBuffer buf = new StringBuffer(text.length() + 4);

            buf.append("<li>");
            buf.append(text);
            return buf.toString();
        }
    }

    public String toPlainText(Language language)
    {
        if(elem instanceof NodeElement) {
            ArrayList elems = ((NodeElement)elem).getChildren();
            StringBuffer buf = new StringBuffer(64 * elems.size());

            for(int i = 0; i < elems.size(); i++)
                buf.append(((Element)elems.get(i)).toPlainText(language));
            return buf.toString();
        } else {
            StringBuffer buf = new StringBuffer(text.length() + 1);

            buf.append(text);
            buf.append("\n");
            return buf.toString();
        }
    }


    public String toXML()
    {
        StringBuffer buf = new StringBuffer(text.length() + 33);

        buf.append("<user-constraint>");
        buf.append(text);
        buf.append("</user-constraint>");
        return buf.toString();
    }
}
