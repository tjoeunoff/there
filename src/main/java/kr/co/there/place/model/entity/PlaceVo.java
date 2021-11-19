package kr.co.there.place.model.entity;

import java.util.List;
import java.util.Objects;

import kr.co.there.placelikes.model.entity.PlaceLikesVo;
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

	// Join 쿼리문으로 생성된 가상 칼럼들
	private int placeLikeCnt;
	private int placeReviewCnt;
	private double placeScoreAvg;
	
	public PlaceVo() {}

	public PlaceVo(int place_idx, int place_viewcnt, String place_name, String place_category, String place_addr,
			String place_opentime, String place_endtime, String place_tel, String place_content, String place_thumb,
			String place_hashtag, String place_url, float place_latitude, float place_longitude, int placeLikeCnt,
			int placeReviewCnt, double placeScoreAvg) {
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
		this.placeLikeCnt = placeLikeCnt;
		this.placeReviewCnt = placeReviewCnt;
		this.placeScoreAvg = placeScoreAvg;
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

	public int getPlaceLikeCnt() {
		return placeLikeCnt;
	}

	public void setPlaceLikeCnt(int placeLikeCnt) {
		this.placeLikeCnt = placeLikeCnt;
	}

	public int getPlaceReviewCnt() {
		return placeReviewCnt;
	}

	public void setPlaceReviewCnt(int placeReviewCnt) {
		this.placeReviewCnt = placeReviewCnt;
	}

	public double getPlaceScoreAvg() {
		return placeScoreAvg;
	}

	public void setPlaceScoreAvg(double placeScoreAvg) {
		this.placeScoreAvg = placeScoreAvg;
	}

	@Override
	public int hashCode() {
		return Objects.hash(placeLikeCnt, placeReviewCnt, placeScoreAvg, place_addr, place_category, place_content,
				place_endtime, place_hashtag, place_idx, place_latitude, place_longitude, place_name, place_opentime,
				place_tel, place_thumb, place_url, place_viewcnt);
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
		return placeLikeCnt == other.placeLikeCnt && placeReviewCnt == other.placeReviewCnt
				&& Double.doubleToLongBits(placeScoreAvg) == Double.doubleToLongBits(other.placeScoreAvg)
				&& Objects.equals(place_addr, other.place_addr) && Objects.equals(place_category, other.place_category)
				&& Objects.equals(place_content, other.place_content)
				&& Objects.equals(place_endtime, other.place_endtime)
				&& Objects.equals(place_hashtag, other.place_hashtag) && place_idx == other.place_idx
				&& Float.floatToIntBits(place_latitude) == Float.floatToIntBits(other.place_latitude)
				&& Float.floatToIntBits(place_longitude) == Float.floatToIntBits(other.place_longitude)
				&& Objects.equals(place_name, other.place_name) && Objects.equals(place_opentime, other.place_opentime)
				&& Objects.equals(place_tel, other.place_tel) && Objects.equals(place_thumb, other.place_thumb)
				&& Objects.equals(place_url, other.place_url) && place_viewcnt == other.place_viewcnt;
	}

	@Override
	public String toString() {
		return "PlaceVo [place_idx=" + place_idx + ", place_viewcnt=" + place_viewcnt + ", place_name=" + place_name
				+ ", place_category=" + place_category + ", place_addr=" + place_addr + ", place_opentime="
				+ place_opentime + ", place_endtime=" + place_endtime + ", place_tel=" + place_tel + ", place_content="
				+ place_content + ", place_thumb=" + place_thumb + ", place_hashtag=" + place_hashtag + ", place_url="
				+ place_url + ", place_latitude=" + place_latitude + ", place_longitude=" + place_longitude
				+ ", placeLikeCnt=" + placeLikeCnt + ", placeReviewCnt=" + placeReviewCnt + ", placeScoreAvg="
				+ placeScoreAvg + "]";
	}


	
	
	


}




