package www.zhizunbao.service;

import java.util.List;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.InsureComment;
import www.zhizunbao.dto.insure.UserInsure;
import www.zhizunbao.dto.manage.UserInfo;

public interface UserInfoService {

	UserInfo findUserByUserName(UserInfo userInfo);

	int userRegister(UserInfo userInfo);

	List<UserInfo> findUserInsure(Integer userId);

	UserInfo insureDetails(int id);

	UserInfo selectByPrimaryKey(Integer userId);

	int updateUserInfo(UserInfo userInfo);

	UserInfo findUserInfoBuId(Integer userId);

	UserInfo userInfoClaims(Integer userId);

	int addUserInsure(UserInsure userInsure);

	int updateUserInsureByOrderId(UserInsure userInsure);

	int updateMsgUp(Integer userId);

	List<UserInfo> findUserDiscounts(Integer userId);
	
	int updateUserPassword(UserInfo userInfo);
	
	List<InsureComment> findCommentById(int id);

	UserInfo findUserInsureById(Integer id);

	int clearMessage(Integer userId);

	UserDiscounts findUserDiscountsById(Integer id);

	int deleteUserDisById(Integer id);

	List<UserDiscounts> findUserDiscountsListByUserId(Integer userId);

	int addUserCollect(Integer insureId, UserInfo userInfo);


	List<Insure> selectrUserCollect(UserInfo userInfo);






}
