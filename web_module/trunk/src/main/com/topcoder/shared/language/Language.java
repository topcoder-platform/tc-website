package com.topcoder.shared.language;

import com.topcoder.shared.problem.DataType;

import com.topcoder.shared.netCommon.CustomSerializable;
import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.*;


/**
 * The <code>Language</code> class is the implementation of all the
 * semantics associated with a supported programming language.  This
 * basically consists of the logic for generating language-dependent
 * method signatures.  An instance of type <code>Language</code> also
 * servers as a convenient identifier for a particular language.
 *
 * @author  Logan Hanks
 * @see     DataType
 */
abstract public class Language
    implements Serializable, Cloneable, CustomSerializable
{
    private int id;
    private String name;

    public Language()
    {
    }

    public Language(int id, String name)
    {
        this.id = id;
        this.name = name;
    }

    public int getId()
    {
        return id;
    }

    public String getName()
    {
        return name;
    }

    /** Two languages are equal if they have the same id */
    public boolean equals(Object o)
    {
      return (o != null) && (o instanceof Language) 
              && (((Language)o).getId() == id);
    }
      

    public void customWriteObject(CSWriter writer)
        throws IOException
    {
        writer.writeInt(id);
        writer.writeString(name);
    }

    public void customReadObject(CSReader reader)
        throws IOException, ObjectStreamException
    {
        id = reader.readInt();
        name = reader.readString();
    }

    abstract public String getMethodSignature(String methodName, DataType returnType,
                                              DataType[] paramTypes, String[] paramNames);

    public static Language getLanguage(int typeID) {
        switch (typeID) {
            case JavaLanguage.ID:
                return JavaLanguage.JAVA_LANGUAGE;
            case CPPLanguage.ID:
                return CPPLanguage.CPP_LANGUAGE;
            case CSharpLanguage.ID:
                return CSharpLanguage.CSHARP_LANGUAGE;
            default:
                throw new IllegalArgumentException("Invalid language: " + typeID);
        }
    }
}

