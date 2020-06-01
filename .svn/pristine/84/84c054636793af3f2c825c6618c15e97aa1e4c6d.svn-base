package ticket.finder.service;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.ShowDetail;
import ticket.finder.dto.ShowXShow;
import ticket.finder.exception.ShowNumNotFoundException;

public interface ShowXShowService {
	List<ShowXShow> getSearch(Map<String, String> map);
	ShowXShow getShowDetail(int showNum) throws ShowNumNotFoundException;
	ShowXShow getShowName(String showName);
	List<ShowXShow> getShowDetailByCode(String showCode);
	List<ShowXShow> getShowHot();
	List<ShowXShow> getHotGenre(Map<String, String> map);
	List<ShowXShow> getRank(Map<String, String> map);
	List<ShowXShow> getAreaNew(Map<String, String> map);
	List<ShowXShow> getAreaEnd(Map<String, String> map);
	List<ShowXShow> getAreaName(Map<String, String> map);
	List<ShowXShow> gettGenreList(String sGenre);	
	List<ShowXShow> getFcltyShow(String fcCode);	
	List<ShowXShow> getSelectShowList();
	List<ShowXShow> getSelectConcerList();
	List<ShowXShow> getSelectMusicalList();
	List<ShowXShow> getSelectPlayList();
	List<ShowXShow> getSelectClassicList();
	List<ShowXShow> getSelectEndShowList();
	List<ShowXShow> getGenreYear(String sGenre);	
	List<ShowXShow> getDaytimeList(String sCode, String showArea);
	List<ShowXShow> getGenreNew(String sGenre);
	List<ShowXShow> getRandomArea(String sGenre);
}
