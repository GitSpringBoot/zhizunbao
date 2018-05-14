package www.zhizunbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.manage.FrontImg;
import www.zhizunbao.dto.manage.Nav;
import www.zhizunbao.mapper.manage.FrontImgMapper;
import www.zhizunbao.mapper.manage.NavMapper;
import www.zhizunbao.service.NavService;

@Service
public class NavServiceImpl implements NavService {

	@Autowired
	private NavMapper navMapper;
	@Autowired
	FrontImgMapper frontImgMapper;

	@Override
	public List<Nav> findNavigationList() {
		// TODO Auto-generated method stub
		return navMapper.findNavigationList();
	}

	@Override
	public void insertNav(Nav nav) {
		// TODO Auto-generated method stub
		navMapper.insertNav(nav);
	}

	@Override
	public void updateNavById(Nav nav) {
		// TODO Auto-generated method stub
		navMapper.updateNavById(nav);
	}

	@Override
	public Nav toFindNavById(Integer nav_id) {
		// TODO Auto-generated method stub
		return navMapper.toFindNavById(nav_id);
	}

	@Override
	public void deleteNavigationById(Integer nav_id) {
		// TODO Auto-generated method stub
		navMapper.deleteNavigationById(nav_id);
	}

	@Override
	public List<Nav> fingNavObj() {
		return navMapper.fingNavObj();
	}

	@Override
	public List<FrontImg> findFronImgBy() {
		List<FrontImg> list = frontImgMapper.findFronImgBy();
		return list;
	}


	@Override
	public List<FrontImg> findBxImg() {
		return frontImgMapper.findBxImg();
	}

	@Override
	public List<FrontImg> findBrowsImg() {
		return frontImgMapper.findBrowsImg();
	}

	@Override
	public List<FrontImg> findBxZb() {
		return frontImgMapper.findBxZb();
	}


	@Override
	public List<FrontImg> findlatestImg() {
		return frontImgMapper.findlatestImg();
	}






}
