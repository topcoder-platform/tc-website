package com.topcoder.shared.language;

//import com.topcoder.netCommon.contest.ContestConstants;

public class JavaLanguage
    extends CStyleLanguage
{
    //public static int ID = ContestConstants.JAVA;
    public final static int ID = 1;
    public static String DESCRIPTION = "Java";

    public static JavaLanguage JAVA_LANGUAGE = new JavaLanguage();

    public JavaLanguage()
    {
        super(ID, DESCRIPTION);
    }
}

