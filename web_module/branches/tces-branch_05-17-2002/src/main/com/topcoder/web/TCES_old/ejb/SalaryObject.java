package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the salary table.
 * @see com.topcoder.web.TCES.ejb.Salary
 * @author Phil Selby, May 22nd, 2002
 */

public class SalaryObject 
  implements Serializable {
	public Integer	salary_id;
	public String	description;
}
