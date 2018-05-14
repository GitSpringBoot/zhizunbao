package www.zhizunbao.mapper.activity;

import java.util.List;

import www.zhizunbao.dto.activity.UserRead;
import www.zhizunbao.dto.activity.UserReadRel;

public interface UserReadRelMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_read_rel
     *
     * @mbggenerated Sun Apr 15 18:56:13 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_read_rel
     *
     * @mbggenerated Sun Apr 15 18:56:13 CST 2018
     */
    int insert(UserReadRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_read_rel
     *
     * @mbggenerated Sun Apr 15 18:56:13 CST 2018
     */
    int insertSelective(UserReadRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_read_rel
     *
     * @mbggenerated Sun Apr 15 18:56:13 CST 2018
     */
    UserReadRel selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_read_rel
     *
     * @mbggenerated Sun Apr 15 18:56:13 CST 2018
     */
    int updateByPrimaryKeySelective(UserReadRel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_read_rel
     *
     * @mbggenerated Sun Apr 15 18:56:13 CST 2018
     */
    int updateByPrimaryKey(UserReadRel record);

	int insertuserId(UserReadRel userId);

	UserReadRel  findUserRel(UserReadRel userReadRel);

	int UpdateinTimeByNewintOrder(int imgOrder);

	int insertSelective(UserRead userRead);

	UserReadRel findFrontActivity(Integer userId);

	

}