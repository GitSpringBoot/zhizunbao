package www.zhizunbao.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.dto.insure.Comment;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.Type;
import www.zhizunbao.dto.manage.UserInfo;
import www.zhizunbao.service.CommentService;
import www.zhizunbao.service.InsureService;
import www.zhizunbao.utils.FMUtils;
import www.zhizunbao.utils.PageUtil;

@Controller
@RequestMapping("/frontInsure/")
public class FrontInsureController {

	@Autowired
	private InsureService insureService;
	@Autowired
	private CommentService commentService;
	/**
	 * 
	 * Mr吴  2018年4月20日 下午2:21:12
	 * 功能 ：默认查询pid为1的所有保险
	 * @param request
	 * @param pid
	 * @return
	 */
	@RequestMapping("findAllInsure")
	public String findAllInsure(HttpServletRequest request,Integer typeId){
		 if (null==typeId) {
			typeId=1;
		}
		 Type type = insureService.findTypeBytypeId(typeId);
		 List<Type> topTypeList = insureService.findTopTypeList();
		 List<Type> typeList = insureService.findTypeListByTypeId(typeId);
		 List<Insure> insureList = insureService.findInsureListByPid(typeId);
		 for (Insure insure : insureList) {
			int commentCount = commentService.findCommentCountByInsureId(insure);
			insure.setCommentCount(commentCount);
		}
		 request.getSession().setAttribute("topTypeList", topTypeList);
		 request.getSession().setAttribute("type", type);
		 request.getSession().setAttribute("typeList", typeList);
		 request.setAttribute("insureList", insureList);
		return "front/insure/insure_list";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月20日 下午3:05:49
	 * 功能 ：查询类型一样的所有保险
	 * @param request
	 * @param typeId
	 * @return
	 */
	@RequestMapping("findTheSameTypeInsureByTypeId")
	public String findTheSameTypeInsureByTypeId(HttpServletRequest request,Integer typeId){
		List<Insure> insureList = insureService.findInsureListByTypeId(typeId);
		for (Insure insure : insureList) {
			int commentCount = commentService.findCommentCountByInsureId(insure);
			insure.setCommentCount(commentCount);
		}
		request.setAttribute("insureList", insureList);
		return "front/insure/insure_list";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月26日 上午11:28:50
	 * 功能 ：根据id查询保险
	 * @param request
	 * @param insureId
	 * @return
	 */
	@RequestMapping("findInsureByInsureId")
	public String findInsureByInsureId(HttpServletRequest request,Integer insureId,String currentPage){
		/*Insure insure = insureService.findInsureByInsureId(insureId);*/
		Insure insure = insureService.findInsureInformationByInsureId(insureId);
		int count = commentService.findCommentCountByInsureId(insure);
		insure.setCommentCount(count);
		int pageSize = 5;
		PageUtil page = new PageUtil(currentPage, pageSize, count);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("insureId", insureId);
		map.put("startIndex", page.getPageRecord());
		map.put("pageSize", pageSize);
		List<Comment> comment = commentService.findCommentLimit(map);
		request.setAttribute("insure", insure);
		request.setAttribute("comment", comment);
		request.setAttribute("page", page);
		return "front/insure/insure";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月26日 上午11:29:09
	 * 功能 ：根据保险名称查询保险
	 * @param request
	 * @param chaxun
	 * @return
	 */
	@RequestMapping("findInsureListByName")
	public String findInsureListByName(HttpServletRequest request,String chaxun,String currentPage){
		if ("请输入关键字".equals(chaxun) || "".equals(chaxun) || null==chaxun) {
			Insure insure = new Insure();
			insure.setInsureName("");
			int count = insureService.findInsureCountByName(insure);
			int pageSize = 3;
			PageUtil page = new PageUtil(currentPage, pageSize, count);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("insureName","");
			map.put("startIndex", page.getPageRecord());
			map.put("pageSize", pageSize);
			List<Insure> findInsureList = insureService.findInsureListLimit(map);
			for (Insure insure2 : findInsureList) {
				int commentCount = commentService.findCommentCountByInsureId(insure2);
				insure2.setCommentCount(commentCount);
			}
			request.setAttribute("insure", insure);
			request.setAttribute("findInsureList", findInsureList);
			request.setAttribute("page", page);
		}else {
			Insure insure = new Insure();
			insure.setInsureName(chaxun);
			int count = insureService.findInsureCountByName(insure);
			int pageSize = 3;
			PageUtil page = new PageUtil(currentPage, pageSize, count);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("insureName",chaxun);
			map.put("startIndex", page.getPageRecord());
			map.put("pageSize", pageSize);
			List<Insure> findInsureList = insureService.findInsureListLimit(map);
			for (Insure insure2 : findInsureList) {
				int commentCount = commentService.findCommentCountByInsureId(insure2);
				insure2.setCommentCount(commentCount);
			}
			request.setAttribute("insure", insure);
			request.setAttribute("findInsureList", findInsureList);
			request.setAttribute("page", page);
		}
		
		return "front/insure/find_insure_list";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月26日 上午11:28:50
	 * 功能 ：根据id查询保险
	 * @param request
	 * @param insureId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("findInsureByInsureIdFree")
	public void findInsureByInsureIdFree(HttpServletRequest request,HttpServletResponse response,Integer insureId,String currentPage) throws Exception{
		/*Insure insure = insureService.findInsureByInsureId(insureId);*/
		UserInfo userInfo1 = (UserInfo) request.getSession().getAttribute("userInfo1");
		Insure insure = insureService.findInsureInformationByInsureId(insureId);
		int count = commentService.findCommentCountByInsureId(insure);
		insure.setCommentCount(count);
		int pageSize = 5;
		PageUtil page = new PageUtil(currentPage, pageSize, count);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("insureId", insureId);
		map.put("startIndex", page.getPageRecord());
		map.put("pageSize", pageSize);
		List<Comment> comment = commentService.findCommentLimit(map);
		Map<String,Object> map2 = new HashMap<String, Object>();
		map2.put("insure",insure );
		map2.put("comment", comment);
		map2.put("page", page);
		map2.put("userInfo1", userInfo1);
		FMUtils.createHtml(request, "insure.ftl", "insure.html", map2);
		Thread.sleep(1000);
		response.sendRedirect("/zhizunbao/html/insure.html");
	}
}
