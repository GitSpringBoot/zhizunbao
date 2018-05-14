package www.zhizunbao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.zhizunbao.dto.manage.CarouselImg;
import www.zhizunbao.dto.manage.FrontImg;
import www.zhizunbao.dto.manage.ImgType;
import www.zhizunbao.service.CarouselImgService;
import www.zhizunbao.utils.FilesUtils;

@Controller
@RequestMapping("/carouselimg/")
public class CarouselImgController {

	@Autowired
	private CarouselImgService carouselImgService;
	/**
	 * 
	 * JiJi  2018年4月17日 上午11:24:08
	 * 功能 ： 获取轮播图片列表
	 * @param request
	 * @return
	 */
	@RequestMapping("tocarouselimg")
	public String tocarousel_img(HttpServletRequest request){
		List<CarouselImg> carouselImgs = carouselImgService.findCarouseImgList();
		request.setAttribute("carouselImgs", carouselImgs);
		return "admin/carouselimg/carousel_img_list";
	}
	/**
	 * 
	 * JiJi  2018年4月18日 下午2:50:13
	 * 功能 ： 跳转图片添加页面
	 * @return
	 */
	@RequestMapping("toInsertCarouselImg")
	public String toInsertCarouselImg(){
		return "admin/carouselimg/carousel_img_insert";
	}
	/**
	 * 
	 * JiJi  2018年4月18日 下午8:18:04
	 * 功能 ：跳转更改图片顺序页面
	 * @return
	 */
	@RequestMapping("toUpdatecarouselImgOrderById")
	public String toUpdatecarouselImgOrderById(Integer img_id,HttpServletRequest request){
		CarouselImg carouselImg=carouselImgService.findCarouseImgById(img_id);
		request.setAttribute("carouselImg", carouselImg);
		return "admin/carouselimg/carouse_img_order_update";
	}
	/**
	 * 
	 * JiJi  2018年4月18日 下午8:59:21
	 * 功能 ：修改图片顺序
	 * @param carouselImg
	 * @return
	 */
	@RequestMapping("updateImgOrder")
	public String updateImgOrder(HttpServletRequest request,CarouselImg carouselImg){
		carouselImgService.updateImgOrder(request,carouselImg);
		return "redirect:tocarouselimg";
	}
	/**
	 * 
	 * JiJi  2018年4月19日 下午9:42:12
	 * 功能 ：将库图片设为轮播图片
	 * @param img_id
	 * @param request
	 * @return
	 */
	@RequestMapping("toSetImgTocarouselImg")
	public String toSetImgTocarouselImg(Integer img_id,HttpServletRequest request){
		carouselImgService.setImgTocarouselImg(img_id);
		return "redirect:tocarouselimg";
	}
	/** 
	 * Administrator  2018年4月22日 下午8:16:58
	 * 功能 ：普通图片列表
	 * @param request
	 * @return
	 */
	@RequestMapping("toIndexImg")
	public String common_list(HttpServletRequest request){
		List<FrontImg> list = carouselImgService.findFroetImg();
		int	sum = carouselImgService.getCount();
		request.setAttribute("sum", sum);
		request.setAttribute("list", list);
		return "admin/carouselimg/index_Img_list";
	}
	/** 
	 * Administrator  2018年4月21日 下午5:13:16
	 * 功能 ：上传页面
	 * @return
	 */
	@RequestMapping("touploading")
	public String touploading(HttpServletRequest request){
		List<ImgType> list = carouselImgService.findImgType();
		request.setAttribute("list", list);
		return "admin/carouselimg/touploadimg";
	}
	/** 
	 * Administrator  2018年4月22日 下午7:37:07
	 * 功能 ：上传图片
	 * @param request
	 * @param imagefile
	 * @param frontImg
	 * @return
	 */
	@RequestMapping("AddPicture")
	public String AddPicture(HttpServletRequest request,MultipartFile imagefile ,FrontImg frontImg){
		String imgUrl = FilesUtils.FilesUpload_xm(request, imagefile, "/upload");
		frontImg.setImgUrl(imgUrl);
		 carouselImgService.insertSelective(frontImg);
		return "redirect:toIndexImg";
	}
	/** 
	 * Administrator  2018年4月22日 下午9:15:35
	 * 功能 ：删除图片
	 * @param request
	 * @param imgId
	 * @return
	 */
	@RequestMapping("delectindeximg")
	@ResponseBody
	public int delCommon(HttpServletRequest request ,Integer imgId ){
		int i = carouselImgService.deleteByPrimaryKey(request,imgId);
		return i;
	}
	/** 
	 * Administrator  2018年4月22日 下午9:15:50
	 * 功能 ：回现
	 * @param request
	 * @param imgId
	 * @return
	 */
	@RequestMapping("findindeximg")	
	public String findCommon(HttpServletRequest request,Integer imgId){
		List<ImgType> list = carouselImgService.findImgType();
		FrontImg frontImg = carouselImgService.selectByPrimaryKey(imgId);
		request.setAttribute("frontImg", frontImg);
		request.setAttribute("list", list);
		return "admin/carouselimg/index_img_update";
	}
	/** 
	 * Administrator  2018年4月22日 下午10:36:08
	 * 功能 ：修改图片
	 * @param request
	 * @param imagefile
	 * @param frontImg
	 * @return
	 */
	@RequestMapping("updateindeximg")
	public  String updateCommon(HttpServletRequest request,MultipartFile imagefile,FrontImg frontImg){
		int i ;
		if(imagefile!=null&&imagefile.getSize()!=0){
			String imgUrl = FilesUtils.FilesUpload_xm(request, imagefile, "/upload");
			frontImg.setImgUrl(imgUrl);
				i = carouselImgService.updateByPrimaryKeySelective(frontImg);
		}else{
				i = carouselImgService.updateByPrimaryKeySelective(frontImg);
		}
		
		if(i>0){
			request.setAttribute("eroer", "修改成功!!!");
			return "redirect:toIndexImg";
		}else{
			request.setAttribute("eroer", "修改还失败!!!");
			return "redirect:toIndexImg";
		}
	}
}
