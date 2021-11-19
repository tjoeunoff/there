package kr.co.there.placelikes.model.entity;

import java.sql.Date;
import java.util.Objects;

public class PlaceLikesVo {
	private String placelikes_memberid;
	private int placelikes_placeidx;
	private Date placelikes_date;
	
	public PlaceLikesVo() {}

	public PlaceLikesVo(String placelikes_memberid, int placelikes_placeidx, Date placelikes_date) {
		super();
		this.placelikes_memberid = placelikes_memberid;
		this.placelikes_placeidx = placelikes_placeidx;
		this.placelikes_date = placelikes_date;
	}

	public String getPlacelikes_memberid() {
		return placelikes_memberid;
	}

	public void setPlacelikes_memberid(String placelikes_memberid) {
		this.placelikes_memberid = placelikes_memberid;
	}

	public int getPlacelikes_placeidx() {
		return placelikes_placeidx;
	}

	public void setPlacelikes_placeidx(int placelikes_placeidx) {
		this.placelikes_placeidx = placelikes_placeidx;
	}

	public Date getPlacelikes_date() {
		return placelikes_date;
	}

	public void setPlacelikes_date(Date placelikes_date) {
		this.placelikes_date = placelikes_date;
	}

	@Override
	public int hashCode() {
		return Objects.hash(placelikes_date, placelikes_memberid, placelikes_placeidx);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlaceLikesVo other = (PlaceLikesVo) obj;
		return Objects.equals(placelikes_date, other.placelikes_date)
				&& Objects.equals(placelikes_memberid, other.placelikes_memberid)
				&& placelikes_placeidx == other.placelikes_placeidx;
	}

	@Override
	public String toString() {
		return "PlaceLikesVo [placelikes_memberid=" + placelikes_memberid + ", placelikes_placeidx="
				+ placelikes_placeidx + ", placelikes_date=" + placelikes_date + "]";
	}
	
	
	
	
	
}