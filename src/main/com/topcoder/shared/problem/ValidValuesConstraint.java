package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;
import com.topcoder.shared.language.Language;

import java.util.ArrayList;
import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * The <code>ValidValuesConstraint</code> is a constraint containing information
 * as to the valid values of a parameter.
 *
 * @author mitalub
 */
public class ValidValuesConstraint
    extends Constraint
{
    protected ArrayList validValues;
    protected String paramName;
    protected int dimension;

    /**
     * @param validValues An ArrayList where each element is an instance of
     *                    Value or Range, and the valid
     *                    elements are those elements in any one
     *                    of the Ranges or Values.
     * @param paramName  The name of the parameter.
     * @param dimension  The dimension this constraint refers to. 
     */
    public ValidValuesConstraint(ArrayList validValues, 
                                int dimension,
                                String paramName)
    {
        this.validValues = validValues;
        this.paramName = paramName;
        this.dimension = dimension;
    }

    public ValidValuesConstraint()
    {
    }

    public ArrayList getValidValues() 
    { 
      return validValues; 
    }

    public int getDimension() 
    {
      return dimension; 
    }

    public String getParamName() 
    { 
      return paramName; 
    }


    public void customWriteObject(CSWriter writer)
        throws IOException
    {
        writer.writeArrayList(validValues);
        writer.writeString(paramName);
        writer.writeInt(dimension);
    }

    public void customReadObject(CSReader reader)
        throws IOException, ObjectStreamException
    {
        validValues = reader.readArrayList();
        paramName = reader.readString();
        dimension = reader.readInt();
    }

    public String toHTML(Language language)
    {
        StringBuffer sb = new StringBuffer(5 * validValues.size());
        sb.append("<li>");
        for(int i = 0; i < dimension; i++)
        {
            if(i == 0)
            {
                sb.append("Elements of ");
            }
            else
            {
                sb.append("elements of ");
            }
        }

        sb.append(paramName);
        sb.append(" must be ");

        for(int i = 0; i < validValues.size(); i++)
        {
            sb.append(((Element)validValues.get(i)).toHTML(language));
            if(i < validValues.size() - 2)
            {
              sb.append(", ");
            }
            else if(i == validValues.size() - 2)
            {
              sb.append(", or ");
            }
        } 
        return sb.toString();
    }

    public String toXML()
    {
        StringBuffer sb = new StringBuffer();
        sb.append("<valid-values>");
        for(int i = 0; i < validValues.size(); i++)
        {
            sb.append(((Element)validValues.get(i)).toXML());
        }
        sb.append("</valid-values>");
        return sb.toString();
    }

    public String toPlainText(Language lang){
        //todo this isn't currently used, and there's no time to add it right now
        return toHTML(lang);
    }

}


