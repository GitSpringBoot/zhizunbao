package www.zhizunbao.service;

import java.util.List;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.activity.UserRead;
import www.zhizunbao.dto.activity.UserReadRel;
import www.zhizunbao.dto.manage.FrontImg;

public interface FrontActivityService {

	List<FrontImg> findBxImg();

	List<FrontImg> findBrowsImg();

	UserRead findUserRead(int imgOrder);

	int UpdateinTimeByNewinTime(UserReadRel userReadRel);

	int insertuserId(UserReadRel userId);

	UserReadRel  findUserRel(UserReadRel userReadRel);

	int UpdateinTimeByNewintOrder(int imgOrder);

	int insertSelective(UserRead userRead);

	int insertSelective(UserReadRel userReadRel);

	UserReadRel findFrontActivity(Integer userId);

	int updateByPrimaryKeySelective(UserReadRel userReadRel2);

	int insetUserDiscountsifo(UserDiscounts userDiscounts);

}
