package www.zhizunbao.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.InsureComment;
import www.zhizunbao.dto.insure.UserInsure;
import www.zhizunbao.dto.manage.UserInfo;
import www.zhizunbao.mapper.activity.UserDiscountsMapper;
import www.zhizunbao.mapper.insure.InsureMapper;
import www.zhizunbao.mapper.insure.UserInsureMapper;
import www.zhizunbao.mapper.manage.UserInfoMapper;
import www.zhizunbao.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private UserInsureMapper userInsureMapper;
	@Autowired
	private UserDiscountsMapper userDiscountsMapper;
	@Autowired
	RedisTemplate<String, Object> redisTemplate;
	@Autowired
	private InsureMapper insureMapper;
	@Override
	public UserInfo findUserByUserName(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.findUserByUserName(userInfo);
	}

	@Override
	public int userRegister(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.insertSelective(userInfo);
	}

	@Override
	public List<UserInfo> findUserInsure(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.findUserInsure(userId);
	}

	@Override
	public UserInfo insureDetails(int id) {
		// TODO Auto-generated method stub
		return userInfoMapper.insureDetails(id);
	}

	@Override
	public UserInfo selectByPrimaryKey(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByPrimaryKey(userId);
	}

	@Override
	public int updateUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKeySelective(userInfo);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月23日 下午9:08:28
	 * 功能 ：根据id查询userinfo
	 * @param userId
	 * @return
	 */
	@Override
	public UserInfo findUserInfoBuId(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByPrimaryKey(userId);
	}

	@Override
	public UserInfo userInfoClaims(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.userInfoClaims(userId);
	}
	
	
	/**
	 * 
	 * Mr吴  2018年4月24日 下午1:04:42
	 * 功能 ：生成购买保险订单
	 * @param userInsure
	 * @return
	 */
	@Override
	public int addUserInsure(UserInsure userInsure) {
		// TODO Auto-generated method stub
		return userInsureMapper.insertSelective(userInsure);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月24日 下午3:29:31
	 * 功能 ：修改订单状态
	 * @param userInsure
	 * @return
	 */
	@Override
	public int updateUserInsureByOrderId(UserInsure userInsure) {
		// TODO Auto-generated method stub
		return userInsureMapper.updateByOrderIdSelective(userInsure);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月24日 下午3:52:50
	 * 功能 ：用户消息加1
	 * @return
	 */
	@Override
	public int updateMsgUp(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateMsgUp(userId);
	}

	@Override
	public List<UserInfo> findUserDiscounts(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.findUserDiscounts(userId);
	}

	@Override
	public int updateUserPassword(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateUserPassword(userInfo);
	}

	@Override
	public List<InsureComment> findCommentById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 
	 * Mr吴  2018年4月26日 下午5:43:51
	 * 功能 ：根据id查询未支付订单详情
	 * @param id
	 * @return
	 */
	@Override
	public UserInfo findUserInsureById(Integer id) {
		// TODO Auto-generated method stub
		return userInfoMapper.findUserInsureById(id);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月29日 上午8:58:45
	 * 功能 ：清除消息
	 * @param userId
	 * @return
	 */
	@Override
	public int clearMessage(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.clearMessage(userId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月29日 下午5:44:15
	 * 功能 ：根据id 查询优惠金额
	 * @param id
	 * @return
	 */
	@Override
	public UserDiscounts findUserDiscountsById(Integer id) {
		return userDiscountsMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月29日 下午5:53:21
	 * 功能 ：优惠券已经使用，删除相应优惠券
	 * @param id
	 * @return
	 */
	@Override
	public int deleteUserDisById(Integer id) {
		// TODO Auto-generated method stub
		return userDiscountsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<UserDiscounts> findUserDiscountsListByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return userDiscountsMapper.findUserDiscountsListByUserId(userId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月30日 下午12:13:13
	 * 功能 ：用户收藏保险
	 * @param insureId
	 * @param userInfo
	 * @return
	 */
	@Override
	public int addUserCollect(Integer insureId, UserInfo userInfo) {
		int i = 0;
		try {
			redisTemplate.opsForSet().add("collect"+userInfo.getUserId().toString(), insureId.toString());
			i=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	/**
	 * 
	 * Mr吴  
	 * 功能 ：查询用户收藏保险
	 * @param insureId
	 * @param userInfo
	 * @return
	 */
	@Override
	public List<Insure> selectrUserCollect( UserInfo userInfo) {
		Set<Object> members = redisTemplate.opsForSet().members("collect"+userInfo.getUserId().toString());
		ArrayList<Object> list = new ArrayList<Object>(members);
		ArrayList<Insure> list2 = new ArrayList<Insure>();
		for (Object object : list) {
			int insureId = Integer.parseInt(object.toString());
			Insure selectByPrimaryKey = insureMapper.selectByPrimaryKey(insureId);
			list2.add(selectByPrimaryKey);
		}
		
		return list2;
	}
	
}