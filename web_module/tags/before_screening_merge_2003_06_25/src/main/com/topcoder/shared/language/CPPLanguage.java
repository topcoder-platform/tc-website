package com.topcoder.shared.language;

//import com.topcoder.netCommon.contest.ContestConstants;

public class CPPLanguage
    extends CStyleLanguage
{
    //public static int ID = ContestConstants.CPP;
    public final static int ID = 3;
    public final static String DESCRIPTION = "C++";

    public static CPPLanguage CPP_LANGUAGE = new CPPLanguage();

    public CPPLanguage()
    {
        super(ID, DESCRIPTION);
    }
}

