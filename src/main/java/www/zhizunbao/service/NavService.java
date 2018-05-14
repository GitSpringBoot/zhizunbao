package www.zhizunbao.service;

import java.util.List;
import www.zhizunbao.dto.manage.FrontImg;
import www.zhizunbao.dto.manage.Nav;

public interface NavService {

	List<Nav> findNavigationList();

	void insertNav(Nav nav);

	void updateNavById(Nav nav);

	Nav toFindNavById(Integer nav_id);

	void deleteNavigationById(Integer nav_id);

	List<Nav> fingNavObj();

	List<FrontImg> findFronImgBy();


	List<FrontImg> findBxImg();

	List<FrontImg> findBrowsImg();

	List<FrontImg> findBxZb();

	List<FrontImg> findlatestImg();

	



}
