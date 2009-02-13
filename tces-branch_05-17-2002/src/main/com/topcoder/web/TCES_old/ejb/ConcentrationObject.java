package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the concentration table.
 * @see com.topcoder.web.TCES.ejb.Concentration
 * @author Phil Selby, May 22nd, 2002
 */

public class ConcentrationObject 
  implements Serializable {
	public Long	concentration_id;
	public Integer	concentration_type_id;
	public Long	education_id;
	public Integer	subject_id;
}
