package www.zhizunbao.service;

import java.util.List;

import www.zhizunbao.dto.activity.UserRead;

public interface UserReadService {

	List<UserRead> findReadList();

	int addUserRead(UserRead userRead);

	Integer deleteByPrimaryKey(Integer readId);

	Object selectUserReadOne(Integer readId);

	Integer updateUserRead(UserRead userRead);

	int uploadImg(String imgUrl, UserRead userRead);

	List<UserRead> userReadActivityList();

}
