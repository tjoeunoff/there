package kr.co.there.review.model.entity;

import java.sql.Date;
import java.util.Objects;

public class ReviewVo {
	private int review_placeidx, review_score;
	private String review_memberid, review_content;
	private Date review_date;
	
	public ReviewVo() {}

	public ReviewVo(int review_placeidx, int review_score, String review_memberid, String review_content,
			Date review_date) {
		super();
		this.review_placeidx = review_placeidx;
		this.review_score = review_score;
		this.review_memberid = review_memberid;
		this.review_content = review_content;
		this.review_date = review_date;
	}

	public int getReview_placeidx() {
		return review_placeidx;
	}

	public void setReview_placeidx(int review_placeidx) {
		this.review_placeidx = review_placeidx;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public String getReview_memberid() {
		return review_memberid;
	}

	public void setReview_memberid(String review_memberid) {
		this.review_memberid = review_memberid;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getreview_date() {
		return review_date;
	}

	public void setreview_date(Date review_date) {
		this.review_date = review_date;
	}

	@Override
	public int hashCode() {
		return Objects.hash(review_date, review_content, review_memberid, review_placeidx, review_score);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewVo other = (ReviewVo) obj;
		return Objects.equals(review_date, other.review_date) && Objects.equals(review_content, other.review_content)
				&& Objects.equals(review_memberid, other.review_memberid) && review_placeidx == other.review_placeidx
				&& review_score == other.review_score;
	}

	@Override
	public String toString() {
		return "ReviewVo [review_placeidx=" + review_placeidx + ", review_score=" + review_score + ", review_memberid="
				+ review_memberid + ", review_content=" + review_content + ", review_date=" + review_date + "]";
	}
	
	
	
	
}
