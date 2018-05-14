package www.zhizunbao.service;

import java.util.List;

import www.zhizunbao.dto.manage.Manage;

public interface ManageService {

	List<Manage> findManage(Manage manage);

	Integer updateStatus(Manage manage);

	Integer insertSelective(Manage manage);

	Integer deleteByPrimaryKey(Integer manageId);

	Object selectByPrimaryKey(Integer manageId);

	Integer updateManage(Manage manage);

	int uploadImg(String imgUrl, Manage manage);

	Manage login(String username);

	Manage findRoleNameByManage(Integer manageId);

	void uptadeByMLogin(Manage man);

	void uptadeSteMLogin(Integer manageId);

	Integer toResetPassword(Manage manage);

	int updateManageLogin(Manage man);

	int updateLoginNumber(Manage man);


	

}
