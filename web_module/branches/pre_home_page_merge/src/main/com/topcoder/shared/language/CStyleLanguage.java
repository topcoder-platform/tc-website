package com.topcoder.shared.language;

import com.topcoder.shared.problem.DataType;

/**
 * A ``C-style'' language is one in which method signatures are specified
 * as <i>return-type</i> <i>method-name</i> (<i>params</i>...).  Currently
 * every language TopCoder supports is a C-style language in this regard,
 * and thus this class captures the semantics common to C++, C#, and Java.
 *
 * @author  Logan Hanks
 * @see     Language
 */
public class CStyleLanguage
    extends BaseLanguage
{
    public CStyleLanguage()
    {
    }

    public CStyleLanguage(int id, String description)
    {
        super(id, description);
    }

    public String getMethodSignature(String methodName, DataType returnType,
                                     DataType[] paramTypes, String[] paramNames)
    {
        if(paramTypes.length != paramNames.length)
            throw new RuntimeException("CStyleLanguage.getMethodSignature: paramTypes.length != paramNames.length (" +
                                       paramTypes.length + " + " + paramNames.length + ")");

        String returns = returnType.getDescriptor(this);
        String[] params = new String[paramTypes.length];
        int len = returns.length() + methodName.length() + 3; // 3 = ' ' + '(' + ')'

        for(int i = 0; i < params.length; i++) {
            String type = paramTypes[i].getDescriptor(this);

            params[i] = type + ' ' + paramNames[i];
            len += params[i].length();
        }
        len += 2 * (params.length - 1);

        StringBuffer buf = new StringBuffer(len);

        buf.append(returns);
        buf.append(' ');
        buf.append(methodName);
        buf.append('(');
        for(int i = 0; i < params.length; i++) {
            if(i > 0)
                buf.append(", ");
            buf.append(params[i]);
        }
        buf.append(')');
        return buf.toString();
    }
}

