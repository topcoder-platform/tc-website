package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the salary_lu table.
 * @see com.topcoder.web.TCES.ejb.SalaryLu
 * @author Phil Selby, May 22nd, 2002
 */

public class SalaryLuObject 
  implements Serializable {
	public Integer	salary_id;
	public String	salary_desc;
}
