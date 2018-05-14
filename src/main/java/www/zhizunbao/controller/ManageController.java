package www.zhizunbao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.dto.manage.Role;
import www.zhizunbao.service.ManageService;
import www.zhizunbao.service.RoleService;
import www.zhizunbao.utils.Base64Util;
import www.zhizunbao.utils.FilesUtils;
import www.zhizunbao.utils.MD5Util;
@Controller
@RequestMapping("/manage/")
public class ManageController {
	@Autowired
	 ManageService manageService;
	@Autowired
	RoleService roleService;
	 /**
	    * 
	    * Mr高  2018年4月16日 上午9:38:47
	    * 功能 ：跳转人员管理页面
	    * @return
	    */
	   @RequestMapping("toAdmin_manage")
	   public String toAdminManage(ModelMap map,Manage manage){
		   List<Manage> manageList = manageService.findManage(manage);
		   List<Role> roleList = roleService.findRoleList();
		   map.put("roleList", roleList);
		   map.put("manageList",manageList);
		   return "admin/manage/admin_manage";
	   }
	   /**
	    * 
	    * Mr高  2018年4月16日
	    * 功能 ：更改人员状态
	    * @return
	    */
	   @ResponseBody
	   @RequestMapping("toUpdateStatus")
	   public String toUpdateStatus(Manage manage){
		   if(manage.getManageStatus()==1){
				manage.setManageStatus(0);
			}else{
				manage.setManageStatus(1);
			}
		   Integer i = manageService.updateStatus(manage);
			return ""+i;
	   }
	   /**
	    * 
	    * Mr高  2018年4月16日
	    * 功能 ：更改人员状态
	    * @return
	    */
	   @ResponseBody
	   @RequestMapping("toResetPassword")
	   public String toResetPassword(Manage manage){
		    manage.setPassword("000000");
			manage.setPassword(Base64Util.encode(MD5Util.MD5(manage.getPassword())));
		    Integer i = manageService.toResetPassword(manage);
		    return ""+i;
	   }
	   /**
	    * 
	    * Mr高  2018年4月16日
	    * 功能 ：去人员修改页面
	    * @return
	    */
	   
	   @RequestMapping("toUpdManage")
	   public String toUpdManage(Integer manageId,ModelMap map){
		   List<Role> roleList = roleService.findRoleList();
		   map.put("roleList", roleList);
		   map.put("manage", manageService.selectByPrimaryKey(manageId));
		   return "admin/manage/manage_upd";
	   }
	   /**
	    * 
	    * Mr高  2018年4月16日
	    * 功能 ：添加人员
	    * @return
	    */
	   /*@ResponseBody*/
	   @RequestMapping("toManageAdd")
	   public String toManageAdd(Manage manage){
		   manage.setmLogin(0);
		   manage.setManageStatus(0);
		   manage.setmCount(0);
		   Integer i = manageService.insertSelective(manage);
		   return "redirect:/manage/toAdmin_manage";
	   }
	   /**
	    * 
	    * Mr高  2018年4月16日
	    * 功能 ：修改人员
	    * @return
	    */
	   @ResponseBody
	   @RequestMapping("updateManage")
	   public String updateManage(Manage manage){
		   Integer i = manageService.updateManage(manage);
		   return ""+i;
	   }
	   /**
		 * 删除人员
		 */
		@RequestMapping("deleteManage")
		@ResponseBody
		public Integer deleteManage(Integer manageId){
			Integer i = manageService.deleteByPrimaryKey(manageId);
			return i;
		}
		/**
		 * 批量删除人员
		 */
		@ResponseBody
		@RequestMapping("deleteAll")
		public String del(String id) {
			int j =0;
	         String[] ids = id.split(",");
	         int[] a = new int[ids.length];
	         for (int i=0;i<ids.length;i++){
	             a[i]=Integer.parseInt(ids[i]);
	         }
	         for (int i=0;i<a.length;i++) {
	             j = manageService.deleteByPrimaryKey(a[i]);
	         }
			if(j>0){
				return "true";
			}else
			return "false";
		}
		
		/**
		 * 
		 * Mr高
		 * 功能 ： 跳转图片上传页面
		 * @return
		 */
		@RequestMapping("toUploadImg")
		public String toUploadImg(HttpServletRequest request,Manage manage){
			
			request.setAttribute("manage", manage);
			return "admin/manage/manage_img_add";
		}
		
		/**
		 * 
		 * Mr高
		 * 功能 ：头像上传
		 * @param 
		 * @param 
		 * @param 
		 * @return
		 */
		@RequestMapping("uploadImg")
		public String uploadImg(Manage manage,MultipartFile imagefile,HttpServletRequest request){
			String imgUrl = FilesUtils.FilesUpload_xm(request, imagefile, "/upload");
			manageService.uploadImg(imgUrl,manage);
			String redirectUrl = "manage/toAdmin_manage";
			request.setAttribute("redirectUrl", redirectUrl);
			return "admin/closeLayer";
		}
}
