package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the exp_technology table.
 * @see com.topcoder.web.TCES.ejb.ExpTechnology
 * @author Phil Selby, May 22nd, 2002
 */

public class ExpTechnologyObject 
  implements Serializable {
	public Integer	experience_id;
	public Integer	technology_id;
}
