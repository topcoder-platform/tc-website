package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class SectorAgreementObject 
  implements Serializable {
	public Integer	sector_id;
	public Integer	user_id;
	public Date	agree_date;
}
