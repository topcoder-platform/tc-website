package com.topcoder.shared.language;

//import com.topcoder.netCommon.contest.ContestConstants;

public class CSharpLanguage
    extends CStyleLanguage
{
    //public static int ID = ContestConstants.CSHARP;
    public final static int ID = 4;
    public final static String DESCRIPTION = "C#";

    public final static CSharpLanguage CSHARP_LANGUAGE = new CSharpLanguage();

    public CSharpLanguage()
    {
        super(ID, DESCRIPTION);
    }
}

