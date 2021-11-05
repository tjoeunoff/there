package kr.co.there.place.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceVo {
	private int placeIdx, placeViewCnt;
	private String placeName, placeCategory, placeAddr, 
		placeOpentime, placeEndtime, placeTel, placeContent, placeThumb, placeHashtag;
	private float placeLng, placeLat;
	
	
}