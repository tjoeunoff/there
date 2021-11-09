package kr.co.there.place.model.entity;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Getter
//@Setter
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class PlaceVo{
	private int place_idx, place_viewcnt;
	private String place_name, place_category, place_addr,
		place_opentime, place_endtime, place_tel, place_content, place_thumb, place_hashtag, place_url;
	private float place_latitude, place_longitude;


	public PlaceVo() {}


	public PlaceVo(int place_idx, int place_viewcnt, String place_name, String place_category, String place_addr,
			String place_opentime, String place_endtime, String place_tel, String place_content, String place_thumb,
			String place_hashtag, String place_url, float place_latitude, float place_longitude) {
		super();
		this.place_idx = place_idx;
		this.place_viewcnt = place_viewcnt;
		this.place_name = place_name;
		this.place_category = place_category;
		this.place_addr = place_addr;
		this.place_opentime = place_opentime;
		this.place_endtime = place_endtime;
		this.place_tel = place_tel;
		this.place_content = place_content;
		this.place_thumb = place_thumb;
		this.place_hashtag = place_hashtag;
		this.place_url = place_url;
		this.place_latitude = place_latitude;
		this.place_longitude = place_longitude;
	}


	public int getPlace_idx() {
		return place_idx;
	}


	public void setPlace_idx(int place_idx) {
		this.place_idx = place_idx;
	}


	public int getPlace_viewcnt() {
		return place_viewcnt;
	}


	public void setPlace_viewcnt(int place_viewcnt) {
		this.place_viewcnt = place_viewcnt;
	}


	public String getPlace_name() {
		return place_name;
	}


	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}


	public String getPlace_category() {
		return place_category;
	}


	public void setPlace_category(String place_category) {
		this.place_category = place_category;
	}


	public String getPlace_addr() {
		return place_addr;
	}


	public void setPlace_addr(String place_addr) {
		this.place_addr = place_addr;
	}


	public String getPlace_opentime() {
		return place_opentime;
	}


	public void setPlace_opentime(String place_opentime) {
		this.place_opentime = place_opentime;
	}


	public String getPlace_endtime() {
		return place_endtime;
	}


	public void setPlace_endtime(String place_endtime) {
		this.place_endtime = place_endtime;
	}


	public String getPlace_tel() {
		return place_tel;
	}


	public void setPlace_tel(String place_tel) {
		this.place_tel = place_tel;
	}


	public String getPlace_content() {
		return place_content;
	}


	public void setPlace_content(String place_content) {
		this.place_content = place_content;
	}


	public String getPlace_thumb() {
		return place_thumb;
	}


	public void setPlace_thumb(String place_thumb) {
		this.place_thumb = place_thumb;
	}


	public String getPlace_hashtag() {
		return place_hashtag;
	}


	public void setPlace_hashtag(String place_hashtag) {
		this.place_hashtag = place_hashtag;
	}


	public String getPlace_url() {
		return place_url;
	}


	public void setPlace_url(String place_url) {
		this.place_url = place_url;
	}


	public float getPlace_latitude() {
		return place_latitude;
	}


	public void setPlace_latitude(float place_latitude) {
		this.place_latitude = place_latitude;
	}


	public float getPlace_longitude() {
		return place_longitude;
	}


	public void setPlace_longitude(float place_longitude) {
		this.place_longitude = place_longitude;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((place_addr == null) ? 0 : place_addr.hashCode());
		result = prime * result + ((place_category == null) ? 0 : place_category.hashCode());
		result = prime * result + ((place_content == null) ? 0 : place_content.hashCode());
		result = prime * result + ((place_endtime == null) ? 0 : place_endtime.hashCode());
		result = prime * result + ((place_hashtag == null) ? 0 : place_hashtag.hashCode());
		result = prime * result + place_idx;
		result = prime * result + Float.floatToIntBits(place_latitude);
		result = prime * result + Float.floatToIntBits(place_longitude);
		result = prime * result + ((place_name == null) ? 0 : place_name.hashCode());
		result = prime * result + ((place_opentime == null) ? 0 : place_opentime.hashCode());
		result = prime * result + ((place_tel == null) ? 0 : place_tel.hashCode());
		result = prime * result + ((place_thumb == null) ? 0 : place_thumb.hashCode());
		result = prime * result + ((place_url == null) ? 0 : place_url.hashCode());
		result = prime * result + place_viewcnt;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlaceVo other = (PlaceVo) obj;
		if (place_addr == null) {
			if (other.place_addr != null)
				return false;
		} else if (!place_addr.equals(other.place_addr))
			return false;
		if (place_category == null) {
			if (other.place_category != null)
				return false;
		} else if (!place_category.equals(other.place_category))
			return false;
		if (place_content == null) {
			if (other.place_content != null)
				return false;
		} else if (!place_content.equals(other.place_content))
			return false;
		if (place_endtime == null) {
			if (other.place_endtime != null)
				return false;
		} else if (!place_endtime.equals(other.place_endtime))
			return false;
		if (place_hashtag == null) {
			if (other.place_hashtag != null)
				return false;
		} else if (!place_hashtag.equals(other.place_hashtag))
			return false;
		if (place_idx != other.place_idx)
			return false;
		if (Float.floatToIntBits(place_latitude) != Float.floatToIntBits(other.place_latitude))
			return false;
		if (Float.floatToIntBits(place_longitude) != Float.floatToIntBits(other.place_longitude))
			return false;
		if (place_name == null) {
			if (other.place_name != null)
				return false;
		} else if (!place_name.equals(other.place_name))
			return false;
		if (place_opentime == null) {
			if (other.place_opentime != null)
				return false;
		} else if (!place_opentime.equals(other.place_opentime))
			return false;
		if (place_tel == null) {
			if (other.place_tel != null)
				return false;
		} else if (!place_tel.equals(other.place_tel))
			return false;
		if (place_thumb == null) {
			if (other.place_thumb != null)
				return false;
		} else if (!place_thumb.equals(other.place_thumb))
			return false;
		if (place_url == null) {
			if (other.place_url != null)
				return false;
		} else if (!place_url.equals(other.place_url))
			return false;
		if (place_viewcnt != other.place_viewcnt)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "PlaceVo [place_idx=" + place_idx + ", place_viewcnt=" + place_viewcnt + ", place_name=" + place_name
				+ ", place_category=" + place_category + ", place_addr=" + place_addr + ", place_opentime="
				+ place_opentime + ", place_endtime=" + place_endtime + ", place_tel=" + place_tel + ", place_content="
				+ place_content + ", place_thumb=" + place_thumb + ", place_hashtag=" + place_hashtag + ", place_url="
				+ place_url + ", place_latitude=" + place_latitude + ", place_longitude=" + place_longitude + "]";
	}
	
	
	


}




