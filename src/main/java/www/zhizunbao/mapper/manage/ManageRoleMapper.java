package www.zhizunbao.mapper.manage;

import www.zhizunbao.dto.manage.ManageRole;

public interface ManageRoleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manage_role_rel
     *
     * @mbggenerated Sun Apr 15 19:00:39 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manage_role_rel
     *
     * @mbggenerated Sun Apr 15 19:00:39 CST 2018
     */
    int insert(ManageRole record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manage_role_rel
     *
     * @mbggenerated Sun Apr 15 19:00:39 CST 2018
     */
    int insertSelective(ManageRole record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manage_role_rel
     *
     * @mbggenerated Sun Apr 15 19:00:39 CST 2018
     */
    ManageRole selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manage_role_rel
     *
     * @mbggenerated Sun Apr 15 19:00:39 CST 2018
     */
    int updateByPrimaryKeySelective(ManageRole record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manage_role_rel
     *
     * @mbggenerated Sun Apr 15 19:00:39 CST 2018
     */
    int updateByPrimaryKey(ManageRole record);
}