package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;
import com.topcoder.shared.language.Language;


import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * The <code>MinSizeConstraint</code> class is for constraints related to the 
 * minimum size (length) of a parameter.  
 *
 * @author mitalub
 */
public class MinSizeConstraint
    extends SizeConstraint
{

    public MinSizeConstraint(int size, int dimension, String paramName)
    {
        super(size, dimension, paramName);
    }

    public MinSizeConstraint()
    {
    }

    public void customWriteObject(CSWriter writer)
        throws IOException
    {
        super.customWriteObject(writer); 
    }

    public void customReadObject(CSReader reader)
        throws IOException, ObjectStreamException
    {
        super.customReadObject(reader);
    }

    public String toHTML(Language language)
    {
        StringBuffer buf = new StringBuffer(256);
        buf.append("<li>");
        for(int i = 0; i < dimension; i++)
        {
            if(i == 0)
            {
                buf.append("Elements of ");
            }
            else
            {
                buf.append("elements of ");
            }
        }
        buf.append(paramName);
        buf.append(" must have a minimum length of ");
        buf.append(size);
        return buf.toString();         
    }

    public String toXML()
    {
      //left to logan to fill in to match the dtd...
      return "";
    }

    public String toPlainText(Language lang){
        //todo this isn't currently used, and there's no time to add it right now
        return toHTML(lang);
    }

}


