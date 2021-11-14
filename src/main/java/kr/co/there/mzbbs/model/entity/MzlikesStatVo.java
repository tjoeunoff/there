package kr.co.there.mzbbs.model.entity;

import java.util.Objects;

public class MzlikesStatVo {
	private int magazine_idx;
	private int numlikes;
	
	public MzlikesStatVo() {}

	public MzlikesStatVo(int magazine_idx, int numlikes) {
		super();
		this.magazine_idx = magazine_idx;
		this.numlikes = numlikes;
	}

	public int getMagazine_idx() {
		return magazine_idx;
	}

	public void setMagazine_idx(int magazine_idx) {
		this.magazine_idx = magazine_idx;
	}

	public int getNumlikes() {
		return numlikes;
	}

	public void setNumlikes(int numlikes) {
		this.numlikes = numlikes;
	}

	@Override
	public String toString() {
		return "MzlikesStatVo [magazine_idx=" + magazine_idx + ", numlikes=" + numlikes + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(magazine_idx, numlikes);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MzlikesStatVo other = (MzlikesStatVo) obj;
		return magazine_idx == other.magazine_idx && numlikes == other.numlikes;
	}
	
}
