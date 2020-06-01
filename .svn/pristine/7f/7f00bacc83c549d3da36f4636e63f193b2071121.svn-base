package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.Review;
import ticket.finder.dto.ReviewSd;
import ticket.finder.dto.ReviewShowInfo;

public interface ReviewDAO {
	int insertReview(Review review);
	int updateStateReview(int reviewNum);
	Review selectReview(int reviewNum);
	List<Review> selectIdReview(String reviewUserId);
	List<Review> selectReviewList();
	int selectReviewCount(String reviewUserId);
	List<ReviewShowInfo> selectUserReviewList(Map<String, String> map);
	List<Review> selectShowReviewList(int reviewShowCode);
	List<ReviewSd> selectReviewSdList();
	List<ReviewShowInfo> selectShowDetailReviewList(String showCode);
}
