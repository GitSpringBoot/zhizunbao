package www.zhizunbao.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.manage.CarouselImg;
import www.zhizunbao.dto.manage.FrontImg;
import www.zhizunbao.dto.manage.ImgType;
import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.mapper.manage.CarouselImgMapper;
import www.zhizunbao.mapper.manage.FrontImgMapper;
import www.zhizunbao.mapper.manage.ImgTypeMapper;
import www.zhizunbao.service.CarouselImgService;
import www.zhizunbao.utils.LogUtil;

@Service
public class CarouselImgServiceImpl implements CarouselImgService {

	@Autowired
	private CarouselImgMapper carouselImgMapper;

	@Autowired
	FrontImgMapper frontImgMapper;
	
	@Autowired
	ImgTypeMapper imgTypeMapper;
	
	@Override
	public List<CarouselImg> findCarouseImgList() {
		// TODO Auto-generated method stub
		return carouselImgMapper.findCarouseImgList();
	}

	@Override
	public CarouselImg findCarouseImgById(Integer id) {
		// TODO Auto-generated method stub
		return carouselImgMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateImgOrder(HttpServletRequest request,CarouselImg carouselImg) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(CarouselImgServiceImpl.class);
		try {
			logger.info("修改图片顺序成功");
			carouselImgMapper.updateByPrimaryKeySelective(carouselImg);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("修改图片顺序失败");
		}
		
	}

	@Override
	public void setImgTocarouselImg(Integer img_id) {
		// TODO Auto-generated method stub
		carouselImgMapper.setImgTocarouselImg(img_id);
	}

	@Override
	public List<FrontImg> findFroetImg() {
		return frontImgMapper.findFroetImg();

	}

	@Override
	public int getCount() {
		return frontImgMapper.getCount();
	}

	@Override
	public int deleteByPrimaryKey(HttpServletRequest request,Integer imgId) {
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(CarouselImgServiceImpl.class);
		try {
			logger.info("图片删除成功");
			return frontImgMapper.deleteByPrimaryKey(imgId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("图片删除失败");
			return 0;
		}
		
	}

	@Override
	public FrontImg selectByPrimaryKey(Integer imgId) {
		return frontImgMapper.selectByPrimaryKey(imgId);
	}

	@Override
	public int updateByPrimaryKeySelective(FrontImg frontImg) {
		return frontImgMapper.updateByPrimaryKeySelective(frontImg);
	}

	@Override
	public List<ImgType> findImgType() {
		return imgTypeMapper.findImgType();
	}

	@Override
	public int insertSelective(FrontImg frontImg) {
		return frontImgMapper.insertSelective(frontImg);
	}




	
}
