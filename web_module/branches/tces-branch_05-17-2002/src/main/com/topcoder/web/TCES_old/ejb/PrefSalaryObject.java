package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the pref_salary table.
 * @see com.topcoder.web.TCES.ejb.PrefSalary
 * @author Phil Selby, May 22nd, 2002
 */

public class PrefSalaryObject 
  implements Serializable {
	public Integer	profile_id;
	public Integer	salary_id;
}
