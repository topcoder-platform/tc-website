package com.topcoder.shared.language;

import com.topcoder.shared.problem.DataType;

/**
 * Represents the VB language implementation of the Language Interface.
 *
 * @see     Language
 * @see     CStyleLanguage
 */

// Note: this is part of the plugin API javadoc.  Please be sure to
// keep the javadoc comments up to date.  When implementing changes,
// be sure to regenerate/repackage the plugin API javadoc.

public class VBLanguage extends CStyleLanguage {

    /** Identifier for the VB language. */
    public final static int ID = 5;

    /** Descriptor for the VB language. */
    public final static String DESCRIPTION = "VB";

    /** Singleton instance for the C# language. */
    public final static VBLanguage VB_LANGUAGE = new VBLanguage();

    /** Constructor of the C# language. */
    public VBLanguage() {
        super(ID, DESCRIPTION);
    }

    public String getMethodSignature(String methodName, DataType returnType, DataType[] paramTypes, String[] paramNames) {
        if (paramTypes.length != paramNames.length)
            throw new RuntimeException("VBLanguage.getMethodSignature: paramTypes.length != paramNames.length (" +
                    paramTypes.length + " + " + paramNames.length + ")");

        String returns = returnType.getDescriptor(this);
        String[] params = new String[paramTypes.length];
        int len = returns.length() + methodName.length() + 3; // 3 = ' ' + '(' + ')'

        for (int i = 0; i < params.length; i++) {
            String type = paramTypes[i].getDescriptor(this);
            params[i] = paramNames[i] + " As " + type;
            len += params[i].length();
        }
        len += 2 * (params.length - 1);

        StringBuffer buf = new StringBuffer(len);

        buf.append("Public Function ");
        buf.append(methodName);
        buf.append('(');
        for (int i = 0; i < params.length; i++) {
            if (i > 0) {
                buf.append(", ");
            }
            buf.append(params[i]);
        }
        buf.append(')');
        buf.append(" As ");
        buf.append(returns);
        return buf.toString();
    }

}