package ticket.finder.service;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.Review;
import ticket.finder.dto.ReviewSd;
import ticket.finder.dto.ReviewShowInfo;
import ticket.finder.exception.ReviewNotFoundExcpetion;

public interface ReviewService {
	void addReview(Review review);
	void modifyStateReview(int reviewNum) throws ReviewNotFoundExcpetion;
	Review getReview(int reviewNum) throws ReviewNotFoundExcpetion;
	List<Review> getIdReview(String reviewUserId);
	List<Review> getReviewList();
	int getReviewCount(String reviewUserId);
	List<ReviewShowInfo> getUserReviewList(Map<String, String> map);
	List<Review> getShowReviewList(int reviewShowCode);
	List<ReviewSd> getReviewSdList();
	List<ReviewShowInfo> getShowDetailReviewList(String showCode);
}
