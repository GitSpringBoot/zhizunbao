package www.zhizunbao.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.apache.http.conn.util.PublicSuffixMatcherLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.claim.UserApply;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.manage.UserInfo;
import www.zhizunbao.service.ClaimRuleService;
import www.zhizunbao.service.UserApplyService;
import www.zhizunbao.service.UserInfoService;
import www.zhizunbao.utils.Base64Util;
import www.zhizunbao.utils.FMUtils;
import www.zhizunbao.utils.FilesUtils;
import www.zhizunbao.utils.MD5Util;
import www.zhizunbao.utils.StringUtils;
import www.zhizunbao.utils.WordUtil;

@Controller
@RequestMapping("/userInfo/")
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private ClaimRuleService claimRuleService;
	@Autowired
	private UserApplyService userApplyService;
	
	/**
	 * 
	 * JiJi  2018年4月20日 上午11:41:35
	 * 功能 ： 前台用户登录
	 * @return
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@RequestMapping("userLogin")
	public String userLogin(HttpServletRequest request,UserInfo userInfo,HttpServletResponse response) throws IOException, ServletException{
		UserInfo userInfo1 = userInfoService.findUserByUserName(userInfo);
		HttpSession session = request.getSession();
		request.setAttribute("msg", "");
		if(null==userInfo1){
			request.setAttribute("msg", "此用户不存在");
			return "front/login";
		}else {
			if(Base64Util.encode(MD5Util.MD5(userInfo.getUserPassword())).equals(userInfo1.getUserPassword())){
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String loginTime = format.format(new Date());
				userInfo1.setLoginTime(loginTime);
				userInfoService.updateUserInfo(userInfo1);
				session.setAttribute("userInfo1", userInfo1);
				String oldURL = (String) session.getAttribute("oldURL");
				if (null!=oldURL && !"".equals(oldURL) && !"userInfo/undefined?".equals(oldURL)) {
					return "redirect:/"+oldURL;
				}else{
					return "redirect:toUserinfoInsure";
				}
			}else {
				request.setAttribute("msg", "密码不正确");
				return "front/login";
			}
		}
	}
	/**
	 * 
	 * JiJi  2018年4月20日 下午7:42:07
	 * 功能 ：注销用户登录
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("userInvalidate")
	public String userInvalidate(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.getSession().invalidate();
		return "redirect:toUserLogin";
	}
	/**
	 * 
	 * JiJi  2018年4月20日 下午8:02:26
	 * 功能 ：用户注册
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("userRegister")
	@ResponseBody
	public boolean userRegister(UserInfo userInfo,HttpServletResponse response,HttpServletRequest request){
		//System.out.println("注册的密码为"+userInfo.getUserPassword());
		boolean flag=false;
			userInfo.setUserPassword(Base64Util.encode(MD5Util.MD5(userInfo.getUserPassword())));
			userInfo.setUserStatus(0);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String regTime = format.format(new Date());
			userInfo.setUserRegtime(regTime);
			String uuid = StringUtils.getUUID();
			userInfo.setUserClinumber(uuid);
			userInfo.setUserStatus(0);
			userInfo.setUserMsg(0);
			int i = userInfoService.userRegister(userInfo);
			if (i>0) {
				flag=true;
			}
			return flag;
	}
	
	/**
	 * 
	 * Mr吴  2018年4月29日 上午10:34:20
	 * 功能 ：用户名验证唯一
	 * @param request
	 * @param userInfo
	 * @return
	 */
	@RequestMapping("testUserName")
	@ResponseBody
	public boolean testUserName(HttpServletRequest request,UserInfo userInfo){
		boolean flag=false;
		UserInfo userInfo2 = userInfoService.findUserByUserName(userInfo);
		if (null == userInfo2) {
			flag=true;
		}
		return flag;
	}	
	
	/**
	 * 
	 * JiJi  2018年4月22日 下午9:27:47
	 * 功能 ：跳转到登录界面
	 * @return
	 */
	@RequestMapping("toUserLogin")
	public String toUserLogin(){
		return "front/login";
	}
	/**
	 * 
	 * JiJi  2018年4月22日 下午9:27:47
	 * 功能 ：跳转到登录界面
	 * @return
	 */
	@RequestMapping("toUserRegister")
	public String toUserRegister(){
		return "front/register";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：去用户理赔页面
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("userInfoClaims")
	public String userInfoClaims(HttpServletRequest request,ModelMap map) {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		if(null!=userInfo){
			map.put("userInsure", userInfoService.findUserInsure(userInfo.getUserId()));
		}
		return "front/userinfo/userinfo_claims";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：去添加理赔页面
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("toAddUserInfoClaims")
	public String toAddUserInfoClaims(int id,ModelMap map) {
		map.put("claimRule", claimRuleService.findRulesOfClaim());
		map.put("userInsure", userInfoService.userInfoClaims(id));   
		return "front/userinfo/userinfo_addClaims";
	}	
	/**
	 * 
	 * 高孟圆
	 * 功能 ：添加理赔
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("addUserInfoClaim")
	public String addUserInfoClaims(MultipartFile imagefile,HttpServletRequest request,UserApply userApply) {
			String imgUrl = FilesUtils.FilesUpload_xm(request, imagefile, "/upload");
			userApplyService.uploadImg(request,imgUrl,userApply);
		return "redirect:userInfoClaims";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：用户保险详情
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("toUserinfoInsure")
	public String toUserinfoInsure(HttpServletRequest request,ModelMap map) {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		if(null!=userInfo){
			map.put("userInsure", userInfoService.findUserInsure(userInfo.getUserId()));
		}
		return "front/userinfo/userinfoInsure_list";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：查看保险详情
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("insureDetails")
	public void insureDetails(int id,UserInfo userInfo,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		userInfo = userInfoService.insureDetails(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userInfo", userInfo);
		FMUtils.createHtml(request, "insureDetails.ftl", "insureDetails.html", map);
		
		response.sendRedirect("/zhizunbao/html/insureDetails.html");
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：用户个人消息
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("toUserinfoMessage")
	public String toUserinfoManage(HttpServletRequest request,ModelMap map) {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		if(null!=userInfo){
			UserInfo userInfo2 = userInfoService.findUserInfoBuId(userInfo.getUserId());
			request.getSession().setAttribute("userInfo1", userInfo2);
			map.put("userInsure", userInfoService.findUserInsure(userInfo.getUserId()));
		}
		return "front/userinfo/userinfo_message";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：去修改信息页面
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("toUserinfoUpdate")
	public String toUserinfoUpd(HttpServletRequest request,ModelMap map) {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		if(null!=userInfo){
			Object object = userInfoService.selectByPrimaryKey(userInfo.getUserId());
			map.put("userInfo", object);
		}
		return "front/userinfo/userinfo_upd";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：修改信息
	 * @param userInfo
	 * @throws IOException 
	 */

	@RequestMapping("updateUserInfo")
	public String updUserInfo(UserInfo userInfo) {
			 userInfoService.updateUserInfo(userInfo);
		    return "redirect:toUserinfoInsure";
	}

	/**
	 * 
	 * 高孟圆
	 * 功能 ：去修改密码
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("toUpdateUserPassword")
	public String toUpdateUserPassword(HttpServletRequest request,ModelMap map) {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		map.put("userInfo", userInfo);
		return "front/userinfo/userinfo_updatePassword";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：修改密码
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("updateUserPassword")
	@ResponseBody
	public boolean updateUserPassword(HttpServletRequest request,UserInfo userInfo) {
		boolean flag=false;
		UserInfo userInfo1 = (UserInfo) request.getSession().getAttribute("userInfo1");
		userInfo.setUserId(userInfo1.getUserId());
		if(null==userInfo.getUserPassword()){
			userInfo.setUserPassword(userInfo1.getUserPassword());
		    flag=true;
		}else{
			userInfo.setUserPassword(Base64Util.encode(MD5Util.MD5(userInfo.getUserPassword())));
			 int i = userInfoService.updateUserPassword(userInfo);
			 if (i>0) {
				 flag=true;
			}
		}
		return flag;
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：去个优惠券页面
	 * @param userInfo
	 * @throws IOException 
	 */
	
	@RequestMapping("toUserDiscounts")
	public String toUserDiscounts(HttpServletRequest request,ModelMap map) {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		if(null!=userInfo){
			List<UserDiscounts> userDiscounts= userInfoService.findUserDiscountsListByUserId(userInfo.getUserId());
			map.put("userDiscounts", userDiscounts);
		}
		return "front/userinfo/userinfo_discounts";
	}
	/**
	 * 
	 * 高孟圆
	 * 功能 ：生成Word文档
	 * @param userInfo
	 * @throws IOException 
	 */
	@RequestMapping("poiWord")
	public void poiWord(int id,HttpServletResponse response,HttpServletRequest request) {
		UserInfo userInfo = userInfoService.insureDetails(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userInfo", userInfo);
		String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
		String path = classpath.replaceAll("WEB-INF/classes","styles");
		System.out.println(path);
		WordUtil.createWord(map, "userinfoInsure.ftl", path, "保单文档.doc");
		WordUtil.downFile(path+"保单文档.doc", response);
    }
	
	/**
	 * 
	 * Mr吴  2018年4月30日 上午11:28:45
	 * 功能 ：用户收藏保险
	 * @param request
	 * @param insureId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("userCollect")
	public void userCollect(HttpServletRequest request,HttpServletResponse response,Integer insureId) throws Exception{
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		userInfoService.addUserCollect(insureId,userInfo);
		response.sendRedirect("/zhizunbao/html/insure.html");
	}
	/**
	 * 
	 * Mr吴  2018年4月30日 上午11:28:45
	 * 功能 ：查询用户收藏保险
	 * @param request
	 * @param insureId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("userCollectList")
	public String userCollectList(HttpServletRequest request,HttpServletResponse response,ModelMap map) throws Exception{
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		List<Insure> userCollect = userInfoService.selectrUserCollect(userInfo);
		map.put("userCollect", userCollect);
		return "front/userinfo/userInfo_collect";
	}
	
}
