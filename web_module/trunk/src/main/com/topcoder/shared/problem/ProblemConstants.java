package com.topcoder.shared.problem;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * Constants for use by problem
 */
public class ProblemConstants
{
  private static TCResourceBundle bundle = new TCResourceBundle("Problem");

  public static int MAIN_COMPONENT = bundle.getIntProperty("MAIN_COMPONENT", 1);
  public static int SECONDARY_COMPONENT = bundle.getIntProperty("SECONDARY_COMPONENT", 0);
  public static int JAVA = bundle.getIntProperty("JAVA", 1);
  public static int CPP = bundle.getIntProperty("CPP", 3);
  public static int CSHARP = bundle.getIntProperty("CSHARP", 4);
}
