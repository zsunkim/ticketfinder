package ticket.finder.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ticket.finder.dto.ShowDetail;
import ticket.finder.dto.ShowXShow;

public interface ShowXShowMapper {
	List<ShowXShow> selectSearch(Map<String, String> map);
	ShowXShow selectShowDetail(int showNum);
	ShowXShow selectShowName(String showName);
	List<ShowXShow> selectShowDetailByCode(String showCode);
	List<ShowXShow> selectShowHot();
	List<ShowXShow> selectHotGenre(Map<String, String> map);
	List<ShowXShow> selectRank(Map<String, String> map);
	List<ShowXShow> selectAreaNew(Map<String, String> map);
	List<ShowXShow> selectAreaEnd(Map<String, String> map);
	List<ShowXShow> selectAreaName(Map<String, String> map);
	List<ShowXShow> selectGenreList(String sGenre);	
	List<ShowXShow> selectFcltyShow(String fcCode);	
	List<ShowXShow> selectShowList();
	List<ShowXShow> selectConcerList();
	List<ShowXShow> selectMusicalList();
	List<ShowXShow> selectPlayList();
	List<ShowXShow> selectClassicList();
	List<ShowXShow> selectEndShowList();
	List<ShowXShow> selectGenreYear(String sGenre);
	List<ShowXShow> selectDaytimeList(@Param("sCode") String sCode, @Param("showArea") String showArea);
	List<ShowXShow> selectGenreNew(String sGenre);
	List<ShowXShow> selectRandomArea(String sGenre);
}
